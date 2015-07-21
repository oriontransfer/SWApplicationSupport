//
//  NSBezierPath (SWGradientAdditions).m
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 18/06/06.
//  Copyright 2006 Samuel Williams. All rights reserved.
//

#import "SWGradientFillAdditions.h"

@implementation CIVector (SWConstructorsAddition)

+ (CIVector*) vectorWithSize: (NSSize)size {
	return [[self class] vectorWithX:size.width Y:size.height];
}

+ (CIVector*) vectorWithPoint: (NSPoint)point {
	return [[self class] vectorWithX:point.x Y:point.y];
}

- (float) lesserX: (CIVector*)other {
	if ([self X] < [other X])
		return [self X];
	else
		return [other X];
}

- (float) lesserY: (CIVector*)other {
	if ([self Y] < [other Y])
		return [self Y];
	else
		return [other Y];
}

- (float) lesserZ: (CIVector*)other {
	if ([self Z] < [other Z])
		return [self Z];
	else
		return [other Z];
}

- (float) lesserW: (CIVector*)other {
	if ([self W] < [other W])
		return [self W];
	else
		return [other W];
}

- (CIVector*) bottomLeft: (CIVector*)other {
	return [CIVector vectorWithX:[self lesserX:other] Y:[self lesserY:other] Z:[self lesserZ:other] W:[self lesserW:other]];
}

- (CGPoint) toCGPoint {
	return CGPointMake([self X], [self Y]);
}

@end

@implementation NSBezierPath (SWGradientAdditions)

- (void)fillGradientFrom: (CIVector*)startVector color:(NSColor*)inStartColor to: (CIVector*)endVector color:(NSColor*)inEndColor {
	CIImage *gradientImage;
	
	inStartColor = [inStartColor colorUsingColorSpaceName:NSCalibratedRGBColorSpace];
	inEndColor = [inEndColor colorUsingColorSpaceName:NSCalibratedRGBColorSpace];
	
	CIColor* startColor = [CIColor colorWithRed:[inStartColor redComponent] green:[inStartColor greenComponent] blue:[inStartColor blueComponent] alpha:[inStartColor alphaComponent]];
	CIColor* endColor = [CIColor colorWithRed:[inEndColor redComponent] green:[inEndColor greenComponent] blue:[inEndColor blueComponent] alpha:[inEndColor alphaComponent]];
	
	CIVector *bottomLeft = [startVector bottomLeft:endVector];
	
	CIFilter* filter;
	
	filter = [CIFilter filterWithName:@"CILinearGradient"];
	[filter setValue:startColor forKey:@"inputColor0"];
	[filter setValue:endColor forKey:@"inputColor1"];
		
	[filter setValue:startVector forKey:@"inputPoint0"];
	[filter setValue:endVector forKey:@"inputPoint1"];
	
	gradientImage = [filter valueForKey:@"outputImage"];
	
	[[NSGraphicsContext currentContext] saveGraphicsState];
	
	CIContext* context = [[NSGraphicsContext currentContext] CIContext];
	
	//can be setClip, but this may increase the current clipping rect beyond that intended
	[self addClip];

	CGRect frameBounds = {
		{0.0, 0.0},
		self.bounds.size
	};

	CGRect gradientBounds = {
		[bottomLeft toCGPoint],
		self.bounds.size
	};

	[context drawImage:gradientImage inRect:gradientBounds fromRect:frameBounds];
	
	[[NSGraphicsContext currentContext] restoreGraphicsState];
}

- (void) fillVerticalGradientTop: (NSColor*)top bottom: (NSColor*)bottom {
	NSRect bounds = [self bounds];
	
	NSPoint a = bounds.origin;
	NSPoint b = NSMakePoint(bounds.origin.x, bounds.origin.y + bounds.size.height);
	
	[self fillGradientFrom:[CIVector vectorWithPoint:a] color:top to:[CIVector vectorWithPoint:b] color:bottom];	
}

- (void) fillHorizontalGradientLeft: (NSColor*)left right: (NSColor*)right {
	NSRect bounds = [self bounds];
	
	NSPoint a = bounds.origin;
	NSPoint b = NSMakePoint(bounds.origin.x + bounds.size.width, bounds.origin.y);
	
	[self fillGradientFrom:[CIVector vectorWithPoint:b] color:left to:[CIVector vectorWithPoint:a] color:right];
}

@end

@implementation SWGradientView

- (instancetype)initWithFrame:(NSRect)frameRect
{
	if ((self = [super initWithFrame:frameRect]) != nil) {
		// Add initialization code here
	}
	return self;
}

- (void)drawRect:(NSRect)rect {
	NSRect viewBounds = [self bounds];
	NSBezierPath *p = [NSBezierPath bezierPathWithRect:viewBounds];
	NSColor *c = [[NSColor blueColor] colorWithAlphaComponent:0.1];
	
	[p fillHorizontalGradientLeft:[NSColor grayColor] right:c];
	
	NSBezierPath *line = [NSBezierPath bezierPath];
	NSPoint a = {viewBounds.origin.x + viewBounds.size.width, viewBounds.origin.y};
	NSPoint b = {viewBounds.origin.x + viewBounds.size.width, viewBounds.origin.y + viewBounds.size.height};
	
	[line moveToPoint:a];
	[line lineToPoint:b];

	[[NSColor blackColor] setStroke];
	
	[line stroke];
}

@end
