//
//  NSWindow+DragAndDropDelegation.m
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 12/07/07.
//  Copyright 2007 Samuel Williams. All rights reserved.
//

#import "NSWindow+WindowVisibility.h"

@implementation NSWindow (VisibilityController)

- (IBAction)toggleWindowVisibility:(id)sender
{
	if ([self isVisible]) {
		[self performClose:self];
	} else {
		[self makeKeyAndOrderFront:self];
	}
}

@end
