//
//  SWSharedInspector.h
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 21/03/06.
//  Copyright 2006 Samuel Williams. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface SWSharedInspector : NSWindowController {
}

+ (id) sharedInspector;
- (void) show;

@end
