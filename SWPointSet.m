//
//  SWPointSet.m
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 13/05/05.
//  Copyright 2005 Samuel Williams. All rights reserved.
//

#import "SWPointSet.h"

@implementation NSIndexSet (SWMathematicsOperatorsAddition) 

- (NSIndexSet*) intersectWithIndexSet: (NSIndexSet*)set {
	NSMutableIndexSet *intersectionSet = [NSMutableIndexSet indexSet];
	if ([self count] == 0 || [set count] == 0) return intersectionSet;
	
	NSRange range = NSMakeRange(0, [self lastIndex]);
	NSRangePointer rangePointer = &range;
	
	unsigned int buffer[32];
	unsigned int count;
	
	do {
		count = [self getIndexes:buffer maxCount:32 inIndexRange:rangePointer];
		
		while (count -= 1) {
			if ([set containsIndex:buffer[count]])
				[intersectionSet addIndex:buffer[count]];
		}
	} while (rangePointer != nil);
	
	return intersectionSet;
}

- (NSIndexSet*) unionWithIndexSet: (NSIndexSet*)set {
	NSMutableIndexSet *unionSet = [self mutableCopy];
	
	[unionSet addIndexes:set];
	
	return unionSet;
}

- (NSIndexSet*) invertWithinRange: (NSRange)range {
	NSMutableIndexSet *inverseSet = [[NSMutableIndexSet alloc] initWithIndexesInRange:range];
	if ([self count] == 0) return inverseSet;
	
	NSRangePointer rangePointer = &range;
	
	unsigned int buffer[32];
	unsigned int count;
	
	do {
		count = [self getIndexes:buffer maxCount:32 inIndexRange:rangePointer];
		
		while (count -= 1) {
			[inverseSet removeIndex:buffer[count]];
		}
		
	} while (rangePointer != nil);
	
	return inverseSet;
}

@end

@implementation SWPointSet
+ (SWPoint) pointForIndex:(unsigned int)index withSize:(SWSize)s {
	int x = index % (int)(s.width);
	return SWPoint (x, (int)((index - x) / s.width));
}

+ (unsigned int) indexForPoint:(SWPoint)point withSize:(SWSize)s {
	return point.x + (point.y * s.width);
}

- (id) init {
	return nil;
}

- (id) initWithSize: (SWSize)newSize indexSet:(NSIndexSet*)newIndexSet {
	if (self = [super init]) {
		size = newSize;
		indexSet = [newIndexSet mutableCopy];
	}
	return self;
}

- (id) initWithSize:(SWSize)newSize {
	if (self = [super init]) {
		size = newSize;
		indexSet = [[NSMutableIndexSet alloc] init];
	}
	return self;
}

- (void) dealloc {
	[super dealloc];
	[indexSet release];
}

- (NSIndexSet*) indexSet {
	return indexSet;
}

- (BOOL) containsPoint:(SWPoint)point {
	return [indexSet containsIndex:[[self class] indexForPoint:point withSize:size]];
}

- (SWPoint) pointForIndex:(unsigned int)index {
	return [[self class] pointForIndex:index withSize:size];
}

- (unsigned int) indexForPoint:(SWPoint)point {
	return [[self class] indexForPoint:point withSize:size];
}

+ (id) pointSetWithSize: (SWSize)size {
	SWPointSet *pointSet = [[self class] alloc];
	return [pointSet initWithSize:size];
}

- (SWPointSet*) intersectWithPointSet: (SWPointSet*)set {	
	NSIndexSet *intersectionSet = [[self indexSet] intersectWithIndexSet:[set indexSet]];
	
	return [[[self class] alloc] initWithSize:self->size indexSet:intersectionSet];
}

- (SWPointSet*) subtractPointSet: (SWPointSet*)set {
	NSMutableIndexSet *intersectionSet = [[self indexSet] mutableCopy];
	[intersectionSet removeIndexes:[set indexSet]];
	
	return [[[self class] alloc] initWithSize:self->size indexSet:intersectionSet];	
}

- (SWPointSet*) unionWithPointSet: (SWPointSet*)set {
	NSIndexSet *unionSet = [[self indexSet] unionWithIndexSet:[set indexSet]];
	
	return [[[self class] alloc] initWithSize:self->size indexSet:unionSet];
}

- (SWPointSet*) inversePointSet {
	NSIndexSet *invertedSet = [[self indexSet] invertWithinRange:NSMakeRange(0, size.width * size.height)];
	
	return [[[self class] alloc] initWithSize:self->size indexSet:invertedSet];
}

- (size_t) count {
	return [[self indexSet] count];
}
@end

@implementation SWMutablePointSet
- (void) addPoint:(SWPoint)point {
	[indexSet addIndex:[[self class] indexForPoint:point withSize:size]];
}

- (void) removePoint:(SWPoint)point {
	[indexSet removeIndex:[[self class] indexForPoint:point withSize:size]];
}

- (NSMutableIndexSet*) indexSet {
	return indexSet;
}
@end