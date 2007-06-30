//
//  SWKQueue.m
//  Sync Manager
//
//  Created by Sammi Williams on 18/02/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import "SWKQueue.h"

@implementation SWKQueue

- (id) init {
	if (self = [super init]) {
		NSLog (@"Setting up SWKQueue...");
		if ((self->queueDesc = kqueue()) == -1) {
			NSLog (@"SWKQueue: Failed to create kqueue!");
			[self release];
			return nil;
		}
		
		self->running = YES;
		self->paths = [[NSMutableDictionary new] retain];
		
		NSLog (@"Detatching thread...");
		[NSThread detachNewThreadSelector:@selector(watcherThread:) toTarget:self withObject:nil];
	}
	
	return self;
}

-(oneway void) release {
    @synchronized(self) {	
        if( [self retainCount] == 2 )
            self->running = NO;
    }

    [super release];
}

-(void) dealloc {
	self->running = NO;
	NSEnumerator *enumerator = [self->paths objectEnumerator];
	NSNumber *fd;
	
	while (fd = [enumerator nextObject]) {
    	if( close( [fd intValue] ) == -1 )
            NSLog(@"dealloc: Couldn't close file descriptor (%d)", errno);
	}
	
	[self->paths release];

	[super dealloc];
}

- (void) addPaths: (NSArray*)paths notifyingAbout: (unsigned int)fflags {
	NSEnumerator *enumerator = [paths objectEnumerator];
	NSString *path;
	
	while (path = [enumerator nextObject])
		[self addPath:path notifyingAbout:fflags];
}

-(void) addPath: (NSString*)path notifyingAbout: (unsigned int)fflags {
	struct timespec nullts = { 0, 0 };
	struct kevent ev;
	int fd = open( [path fileSystemRepresentation], O_EVTONLY, 0 );
	
	NSAssert (fd >= 0, ([NSString stringWithFormat: @"Could not add path (%@)!", path]));
	
    if( fd >= 0 ) {
		SWPathReference *pathReference = [[SWPathReference alloc] initWithPath:path];

		NSAssert (pathReference, @"Could not get path reference");
		
        EV_SET( &ev, fd, EVFILT_VNODE, EV_ADD | EV_ENABLE | EV_CLEAR, fflags, 0, (void*)pathReference);
		
        @synchronized (self) {
			[self->paths setValue:pathReference forKey:[NSNumber numberWithInt: fd]];
            kevent( self->queueDesc, &ev, 1, NULL, 0, &nullts );
        }
    }
}

-(void) removePath: (NSString*)path {
    int fd = -1;
    
    @synchronized( self ) {
        fd = [[self->paths objectForKey:path] intValue];
        
		[self->paths removeObjectForKey:path];
    }
	
	if( close( fd ) == -1 )
        NSLog(@"removePathFromQueue: Couldn't close file descriptor (%d)", errno);
}

- (void) watcherThread: (id)argument {
	int n;
    struct kevent ev;
    struct timespec timeout = { 500, 0 }; // 5 seconds timeout.
	int qfd = self->queueDesc;

	NSLog (@"watcherThread: waiting for events...");    
    while( self->running ) {
		NSAutoreleasePool*  pool = [[NSAutoreleasePool alloc] init];
		
		@try {
			n = kevent( qfd, NULL, 0, &ev, 1, &timeout );
			
			if( n > 0 && ev.filter == EVFILT_VNODE && ev.fflags ) {
				SWPathReference* pref = [[(NSString *)ev.udata retain] autorelease];    // In case one of the notified folks removes the path.
				//[[NSWorkspace sharedWorkspace] noteFileSystemChanged: [pref path]];
				
				id eventStruct = [NSArray arrayWithObjects:[NSNumber numberWithUnsignedInt:ev.fflags], pref, nil];
				[self performSelectorOnMainThread:@selector(_processEvent:) withObject:eventStruct waitUntilDone:NO];
			} if (n == -1) {
				NSLog (@"Error in SWKQueue watcherThread: #%d (%s)", errno, strerror(errno)); 
			}
		} @catch (id exception) {
			NSLog(@"Error in SWKQueue watcherThread: %@", exception);
		}
		
		[pool release];
    }
    
	// Close our kqueue's file descriptor:
	if( close( qfd ) == -1 )
		NSLog(@"release: Couldn't close kqueue (%d)", errno);
	
    NSLog(@"exiting kqueue watcher thread.");
}

- (void) _processEvent: (NSArray*)event {
	[self->delegate kqueue: self eventDidOccur: [[event objectAtIndex:0] unsignedIntValue] forPath:[event objectAtIndex:1]];
}

- (void) setDelegate: (id)newDelegate {
	self->delegate = newDelegate;
}

- (id) delegate {
	return self->delegate;
}

@end