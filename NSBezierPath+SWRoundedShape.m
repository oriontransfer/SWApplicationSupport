//
//  NSBezierPath+SWRoundedShape.m
//  Gocoa
//
//  Created by Samuel Williams on 15/01/11.
//  Copyright 2011 Orion Transfer Ltd. All rights reserved.
//

#import "NSBezierPath+SWRoundedShape.h"

NSPoint interpolatePoints(NSPoint p1, NSPoint p2, CGFloat i)
{
	NSPoint diff = NSMakePoint(p2.x - p1.x, p2.y - p1.y);
	
	return NSMakePoint(p1.x + diff.x * i, p1.y + diff.y * i);
}

@implementation NSBezierPath (SWRoundedShape)

+ (NSBezierPath*) roundedBezierPathWithPoints:(NSArray*)points radius:(CGFloat)radius;
{
	NSBezierPath * path = [[[[self class] alloc] init] autorelease];
	
	unsigned i;
		
	for (i = 0; i < [points count]; i++)
	{
		NSPoint curr = [[points objectAtIndex:i] pointValue];
		NSPoint next = [[points objectAtIndex:(i+1) % [points count]] pointValue];
		
		NSPoint curveEnd = interpolatePoints(curr, next, radius);
		NSPoint nextStart = interpolatePoints(curr, next, 1.0 - radius);
		
		if (i == 0) {
			NSPoint prev = [[points lastObject] pointValue];
			
			NSPoint curveStart = interpolatePoints(prev, curr, 1.0 - radius);
			[path moveToPoint:curveStart];
		}
		
		[path curveToPoint:curveEnd controlPoint1:curr controlPoint2:curr];		
		[path lineToPoint:nextStart];
	}
		
	return path;
}

@end
