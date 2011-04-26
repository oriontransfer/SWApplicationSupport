//
//  NSImage+SWResizedBitmapRep.m
//  Gocoa
//
//  Created by Samuel Williams on 9/01/11.
//  Copyright 2011 Orion Transfer Ltd. All rights reserved.
//

#import "NSImage+SWResizedBitmapRep.h"

@implementation NSImage (SWResizedBitmapRep)

- (NSBitmapImageRep*) cacheBitmapRepresentation:(NSSize)size
{
	NSRect sourceRect = NSMakeRect(0.0, 0.0, 0.0, 0.0);
	sourceRect.size = [self size];
	NSRect bitmapRect = NSMakeRect(0.0, 0.0, size.width, size.height);
	
	NSBitmapImageRep * resized = nil;
	NSImage * scratch = [[[NSImage alloc] initWithSize:bitmapRect.size] autorelease];
	
	[scratch lockFocus];
	[[NSGraphicsContext currentContext] setImageInterpolation:NSImageInterpolationHigh];
	[self drawInRect:bitmapRect fromRect:sourceRect operation:NSCompositeSourceOver fraction:1.0];
	resized = [[[NSBitmapImageRep alloc] initWithFocusedViewRect:bitmapRect] autorelease];
	[scratch unlockFocus];

	// Insert the new bitmap representation at the front.
	//NSMutableArray * representations = [NSMutableArray arrayWithArray:[self representations]];
	//[representations insertObject:resized atIndex:0];
	
	// Reevent all existing representations...
	for (NSImageRep * rep in [self representations])
		[self removeRepresentation:rep];
	
	//[self addRepresentations:representations];
	
	// This hack means that the bitmap is always chosen - because the PDF rasterisation doesn't seem to be getting
	// cached - maybe a bug with Cocoa?
	[self addRepresentation:resized];
	
	return resized;
}

@end
