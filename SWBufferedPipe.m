//
//  SWBufferedPipe.m
//  GPS Tool
//
//  Created by Samuel Williams on 29/03/08.
//  Copyright 2008 Samuel Williams, Orion Transfer Ltd. All rights reserved.
//

#import "SWBufferedPipe.h"

@interface SWBufferedPipe(Private)

- (void) _setupPipe: (NSPipe *) pipe;

- (void) _readComplete: (NSNotification *)note;

@end

@implementation SWBufferedPipe

@synthesize pipe, data, delegate;

- (id) init
{
	self = [super init];
	if (self != nil) {
		[self _setupPipe:[NSPipe pipe]];
	}
	return self;
}

- (id) initWithPipe: (NSPipe *) newPipe;
{
	self = [super init];
	if (self != nil) {
		[self _setupPipe:newPipe];
	}
	return self;
}

- (void) dealloc
{
	NSLog (@"%s", __PRETTY_FUNCTION__);
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];

	if ([data length] > 0)
		NSLog (@"Buffer deallocated with data remaining: %@", data);
	
	[data release];
	data = nil;
	
	[pipe release];
	pipe = nil;
	
	[super dealloc];
}

- (void) _setupPipe: (NSPipe *) newPipe
{
	NSAssert(pipe == nil, @"SWBufferedPipe is already set up!");
	
	data = [[NSMutableData alloc] init];
	pipe = [newPipe retain];
	
	NSFileHandle * handle = [pipe fileHandleForReading];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_readComplete:) name:NSFileHandleReadCompletionNotification object:handle];

	[handle readInBackgroundAndNotify];
}

- (void) _readComplete: (NSNotification *)note {
	NSAssert(data != nil, @"Buffer is not available or has been deallocated prematurely!!");
	
	NSData * readData = [[note userInfo] objectForKey:NSFileHandleNotificationDataItem];
	
	if ([readData length] > 0) {
		//NSLog (@"==> %@", [[[NSString alloc] initWithData:readData encoding:NSUTF8StringEncoding] autorelease]);
	
		[data appendData:readData];
		
		if (delegate && [delegate respondsToSelector:@selector(bufferedPipe:hasNewDataAvailable:)]) {
			[delegate bufferedPipe:self hasNewDataAvailable:readData];
		}
		
		[[pipe fileHandleForReading] readInBackgroundAndNotify];
	}	
}

@end
