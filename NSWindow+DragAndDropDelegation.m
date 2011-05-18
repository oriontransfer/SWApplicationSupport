//
//  NSWindow+DragAndDropDelegation.m
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 3/04/08.
//  Copyright 2008 Samuel Williams. All rights reserved.
//

#import "NSWindow+DragAndDropDelegation.h"


@implementation NSWindow (DragAndDropDelegation)

- (NSDragOperation)draggingEntered:(id <NSDraggingInfo>)sender {
	//NSLog (@"%s", __PRETTY_FUNCTION__);
	if ([[self delegate] respondsToSelector:@selector(window:draggingEntered:)])
		return [[self delegate] window:self draggingEntered:sender];

	return 0;
}

- (NSDragOperation)draggingUpdated:(id <NSDraggingInfo>)sender {
	//NSLog (@"%s", __PRETTY_FUNCTION__);
	if ([[self delegate] respondsToSelector:@selector(window:draggingUpdated:)])
		return [[self delegate] window:self draggingUpdated:sender];
	
	return 0;
}

- (void)draggingExited:(id <NSDraggingInfo>)sender {
	//NSLog (@"%s", __PRETTY_FUNCTION__);
	if ([[self delegate] respondsToSelector:@selector(window:draggingExited:)])
		[[self delegate] window:self draggingExited:sender];
}

- (BOOL)performDragOperation:(id <NSDraggingInfo>)sender {
	//NSLog (@"%s", __PRETTY_FUNCTION__);
	if ([[self delegate] respondsToSelector:@selector(window:performDragOperation:)])
		return [[self delegate] window:self performDragOperation:sender];
	
	return NO;
}

- (BOOL)prepareForDragOperation:(id <NSDraggingInfo>)sender {
	//NSLog (@"%s", __PRETTY_FUNCTION__);
	if ([[self delegate] respondsToSelector:@selector(window:prepareForDragOperation:)])
		return [[self delegate] window:self prepareForDragOperation:sender];
	
	return NO;
}

- (void)concludeDragOperation:(id <NSDraggingInfo>)sender {
	//NSLog (@"%s", __PRETTY_FUNCTION__);
	if ([[self delegate] respondsToSelector:@selector(window:concludeDragOperation:)])
		[[self delegate] window:self concludeDragOperation:sender];
}

@end
