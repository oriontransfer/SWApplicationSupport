//
//  NSBezierPath (SWGradientAdditions).h
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 18/06/06.
//  Copyright 2006 Samuel Williams. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <QuartzCore/QuartzCore.h>

@interface CIVector (SWConstructorsAddition)

+ (CIVector*) vectorWithSize: (NSSize)size;
+ (CIVector*) vectorWithPoint: (NSPoint)point;

- (float) lesserX: (CIVector*)other;
- (float) lesserY: (CIVector*)other;
- (float) lesserZ: (CIVector*)other;
- (float) lesserW: (CIVector*)other;

- (CIVector*) bottomLeft: (CIVector*)other;

- (CGPoint) toCGPoint;

@end

@interface NSBezierPath (SWGradientAdditions)

- (void)fillGradientFrom: (CIVector*)startVector color:(NSColor*)inStartColor to: (CIVector*)endVector color:(NSColor*)inEndColor;
- (void) fillVerticalGradientTop: (NSColor*)top bottom: (NSColor*)bottom;
- (void) fillHorizontalGradientLeft: (NSColor*)left right: (NSColor*)right;

@end

/* An example of how to draw a gradient in a view */
@interface SWGradientView : NSView {
}

@end
