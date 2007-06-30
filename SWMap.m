//
//  SWMap.m
//  Asteroid Miner
//
//  Created by Sammi on 13/05/05.
//  Copyright 2005 Orion Transfer Ltd. All rights reserved.
//

#import "SWMap.h"


@implementation SWMap
- (id) init {
	return nil;
}

- (id) initWithSize:(NSSize)s {
	if (self = [super init]) {
		size = s;
		objects = [[NSMutableArray alloc] initWithCapacity:size.width * size.height];
	}
	return self;
}

- (void) dealloc {
	[super dealloc];
	[objects release];
}

- (id) objectAtPoint:(NSPoint)point {
	return [objects objectAtIndex:point.x + (point.y * size.width)];
}

- (bool) validPoint:(NSPoint)point {
	if (point.x < 0 || point.x > size.width
		|| point.y < 0 || point.y > size.height) return NO;
	else return YES;
}

- (NSSize) size {
	return size;
}

@end

@implementation SWMutableMap

- (void) replaceObjectAtPoint:(NSPoint)point withObject:object {
	[objects replaceObjectAtIndex:point.x + (point.y * size.width) withObject:object];
}

@end