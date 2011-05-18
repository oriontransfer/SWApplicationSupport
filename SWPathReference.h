//
//  SWPathReference.h
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 19/02/06.
//  Copyright 2006 Samuel Williams. All rights reserved.
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
