//
//  NSImage+CenteredDrawing.h
//  Property Manager
//
//  Created by Samuel Williams on 21/02/12.
//  Copyright (c) 2012 Orion Transfer Ltd. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSImage (CenteredDrawing)
// draws the passed image into the passed rect, centered and scaled appropriately.
// note that this method doesn't know anything about the current focus, so the focus must be locked outside this method
- (void)drawCenteredInRect:(NSRect)inRect operation:(NSCompositingOperation)op fraction:(CGFloat)delta;

@end