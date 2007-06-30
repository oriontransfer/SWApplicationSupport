//
//  SWKQueue.h
//  Sync Manager
//
//  Created by Sammi Williams on 18/02/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#include <sys/types.h>
#include <sys/event.h>
#import "SWPathReference.h"

#define SWKQueueDefaultNotifications (NOTE_WRITE | NOTE_RENAME | NOTE_DELETE | NOTE_ATTRIB | NOTE_REVOKE | NOTE_EXTEND | NOTE_LINK)

@interface SWKQueue : NSObject {
	int queueDesc;
	NSMutableDictionary *paths;
	BOOL running;
	
	id delegate;
}

- init;

- (void) addPaths: (NSArray*)paths notifyingAbout: (unsigned int)flags;
- (void) addPath: (NSString*)path notifyingAbout: (unsigned int)flags;

- (void) removePath: (NSString*)path;

- (id) delegate;
- (void) setDelegate: (id)newDelegate;

@end