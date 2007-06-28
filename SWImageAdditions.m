//
//  SWImageAdditions.m
//  Property Manager
//
//  Created by Sammi Williams on 24/06/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import "SWImageAdditions.h"


@implementation NSImage (SWImageAdditions)

- (NSImage*) resizeImage: (NSSize)newSize {
	NSRect originalBounds = NSMakeRect(0, 0, [self size].width, [self size].height);
	float aspect = [self size].width / [self size].height;
	NSRect resizedBounds;
	
	if (aspect < 1.0)
		resizedBounds = NSMakeRect(0, 0, newSize.width * aspect, newSize.height);
	else
		resizedBounds = NSMakeRect(0, 0, newSize.width, newSize.height / aspect);	
	
	NSImage *resized = [[NSImage alloc] initWithSize:resizedBounds.size];
	
	[resized lockFocus];
	
	[NSGraphicsContext saveGraphicsState];
	[[NSGraphicsContext currentContext] setImageInterpolation: NSImageInterpolationHigh];
	
	[self drawInRect:NSMakeRect(0, 0, newSize.width, newSize.height) fromRect:originalBounds operation:NSCompositeSourceOver fraction:1.0];

	[NSGraphicsContext restoreGraphicsState];
	[resized unlockFocus];
	
	return [resized autorelease];
}

- (NSSize) pixelSize {
	return NSMakeSize ([self pixelWidth], [self pixelHeight]);
}

- (float) pixelWidth {
	return [[self bestRepresentationForDevice:nil] pixelsWide];
}

- (float) pixelHeight {
	return [[self bestRepresentationForDevice:nil] pixelsHigh];
}

@end
