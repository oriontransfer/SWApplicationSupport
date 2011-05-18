//
//  NSWindow+WindowVisibility.h
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 12/07/07.
//  Copyright 2007 Samuel Williams. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSWindow (WindowVisibility)

// Provides IBAction based toggling of the visibility of a window.
- (IBAction)toggleWindowVisibility:(id)sender;

@end