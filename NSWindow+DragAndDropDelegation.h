//
//  NSWindow+DragAndDropDelegation.h
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 3/04/08.
//  Copyright 2008 Samuel Williams. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSObject (NSWindowDragAndDropDelegate)

- (NSDragOperation)window: (NSWindow*)window draggingEntered:(id <NSDraggingInfo>)sender;
- (NSDragOperation)window: (NSWindow*)window draggingUpdated:(id <NSDraggingInfo>)sender;
- (void)window: (NSWindow*)window draggingExited:(id <NSDraggingInfo>)sender;

- (BOOL)window: (NSWindow*)window prepareForDragOperation:(id <NSDraggingInfo>)sender;
- (BOOL)window: (NSWindow*)window performDragOperation:(id <NSDraggingInfo>)sender;
- (void)window: (NSWindow*)window concludeDragOperation:(id <NSDraggingInfo>)sender;

@end

@interface NSWindow (DragAndDropDelegation)

- (NSDragOperation)draggingEntered:(id <NSDraggingInfo>)sender;
- (NSDragOperation)draggingUpdated:(id <NSDraggingInfo>)sender;
- (void)draggingExited:(id <NSDraggingInfo>)sender;

- (BOOL)prepareForDragOperation:(id <NSDraggingInfo>)sender;
- (BOOL)performDragOperation:(id <NSDraggingInfo>)sender;
- (void)concludeDragOperation:(id <NSDraggingInfo>)sender;

@end
