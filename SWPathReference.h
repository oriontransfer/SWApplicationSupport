//
//  SWPathReference.h
//  Sync Manager
//
//  Created by Sammi Williams on 19/02/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface SWPathReference : NSObject {
	FSRef ref;
	NSString *path;
}

- initWithPath: (NSString*)path;

- (NSString*) initialPath;
- (NSString*) updateInitialPath;

- (NSString*) path;

@end
