//
//  NSWindow+DragAndDropDelegation.h
//  GPS Tool
//
//  Created by Samuel Williams on 3/04/08.
//  Copyright 2008 Samuel Williams, Orion Transfer Ltd. All rights reserved.
//
//  This software was originally produced by Orion Transfer Ltd.
//    Please see http://www.oriontransfer.org for more details.
//

/*
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

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
