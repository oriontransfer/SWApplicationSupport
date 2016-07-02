//
//  NSImage+CenteredDrawing.m
//  Property Manager
//
//  Created by Samuel Williams on 21/02/12.
//  Copyright (c) 2012 Orion Transfer Ltd. All rights reserved.
//

#import "NSImage+CenteredDrawing.h"

@implementation NSImage (CenteredDrawing)

// draws the passed image into the passed rect, centered and scaled appropriately.
// note that this method doesn't know anything about the current focus, so the focus must be locked outside this method
- (void)drawCenteredInRect:(NSRect)inRect operation:(NSCompositingOperation)op fraction:(CGFloat)delta
{
	NSRect srcRect = NSZeroRect;
	srcRect.size = self.size;
	
	// create a destination rect scaled to fit inside the frame
	NSRect drawnRect = srcRect;
	if (drawnRect.size.width > inRect.size.width)
	{
		drawnRect.size.height *= inRect.size.width/drawnRect.size.width;
		drawnRect.size.width = inRect.size.width;
	}
	
	if (drawnRect.size.height > inRect.size.height)
	{
		drawnRect.size.width *= inRect.size.height/drawnRect.size.height;
		drawnRect.size.height = inRect.size.height;
	}
	
	drawnRect.origin = inRect.origin;
	
	// center it in the frame
	drawnRect.origin.x += (inRect.size.width - drawnRect.size.width)/2;
	drawnRect.origin.y += (inRect.size.height - drawnRect.size.height)/2;
	
	[self drawInRect:drawnRect fromRect:srcRect operation:op fraction:delta respectFlipped:YES hints:nil];
}

@end