//
//  SWSharedInspector.m
//  Model Builder
//
//  Created by Sammi Williams on 21/03/06.
//  Copyright 2006 Sammi Williams. All rights reserved.
//

#import "SWSharedInspector.h"

@interface SWSharedInspector (Private)
- (void)setMainWindow:(NSWindow *)mainWindow;
+ (id*)staticInspector;

@end

@implementation SWSharedInspector

+ (id) sharedInspector {
	id *sharedInspector = [[self class] staticInspector];
	
	if (! *sharedInspector) {
		*sharedInspector = [[[self class] alloc] init];
	}
	
	NSAssert (*sharedInspector != nil, @"Shared Inspector failed to initialize!");
	
	[*sharedInspector showWindow:self];
	
	return *sharedInspector;
}

- (void) windowWillClose: (id)notification {
	NSLog (@"Shared Inspector will close");
}

- (void) dealloc {
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	
	[super dealloc];
}

- (void) windowDidLoad {
	NSLog (@"%@ (Shared Inspector) windowDidLoad", [self className]);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mainWindowChanged:) name:NSWindowDidBecomeMainNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mainWindowResigned:) name:NSWindowDidResignMainNotification object:nil];
	//[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeInspector:) name:NSApplicationWillTerminateNotification object:nil];
	
    [super windowDidLoad];
}
/*
- (void)closeInspector:(NSNotification *)notification {
	[self close];
	[self release];
}
*/
- (void)mainWindowChanged:(NSNotification *)notification {
	NSLog (@"%@ (Shared Inspector) mainWindowChanged", [self className]);
    [self setMainWindow:[notification object]];
}

- (void)mainWindowResigned:(NSNotification *)notification {
	NSLog (@"%@ (Shared Inspector) mainWindowResigned", [self className]);
    [self setMainWindow:nil];
}

- (void)setMainWindow:(NSWindow *)mainWindow {
    NSWindowController *controller = nil;
	
	if (mainWindow)
		controller = [mainWindow windowController];
	
    if (controller && [controller document]) {
        [self setDocument:[controller document]];
    }// else
       // [self setDocument:nil];

}

- (id) document {
	return document;
}

- (void) setDocument: (id) newDoc {
	if (document == newDoc) return;
	
	[self willChangeValueForKey:@"document"];
	
	document = newDoc;

	[self didChangeValueForKey:@"document"];
}

@end
