//
//  SWWhiteView.m
//  Property Manager
//
//  Created by Sammi Williams on 23/06/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import "SWWhiteView.h"


@implementation SWWhiteViewTop

- (void)drawRect:(NSRect)rect {
	NSRect bounds = [self bounds];
	
    [[NSColor whiteColor] setFill];
	[[NSColor blackColor] setStroke];
	
	[[NSBezierPath bezierPathWithRect:rect] fill];
	
	NSBezierPath *path = [NSBezierPath bezierPath];
	[path moveToPoint:NSMakePoint(0, 0)];
	[path lineToPoint:NSMakePoint(bounds.size.width, 0)];
	
	[path stroke];
}

@end

@implementation SWWhiteViewBottom

- (void)drawRect:(NSRect)rect {
	NSRect bounds = [self bounds];
	
    [[NSColor whiteColor] setFill];
	[[NSColor blackColor] setStroke];
	
	[[NSBezierPath bezierPathWithRect:rect] fill];
	
	NSBezierPath *path = [NSBezierPath bezierPath];
	[path moveToPoint:NSMakePoint(0, bounds.size.height)];
	[path lineToPoint:NSMakePoint(bounds.size.width, bounds.size.height)];
	
	[path stroke];
}

@end
