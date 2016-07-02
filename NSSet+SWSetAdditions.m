//
//  NSSet+SWSetAdditions.m
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 27/07/06.
//  Copyright 2006 Samuel Williams. All rights reserved.
//

#import "NSSet+SWSetAdditions.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

@implementation NSSet (SWSetAdditions)

- (NSSet*) subsetConformingTo: (SEL)selector {
	NSEnumerator *setEnumerator = [self objectEnumerator];
	NSMutableSet *newSet = [NSMutableSet setWithCapacity:self.count];
	id object = nil;
	
	while ((object = [setEnumerator nextObject])) {
		if ([object performSelector:selector])
			[newSet addObject:object];
	}
	
	return newSet;
}

- (NSSet*) subsetNotConformingTo: (SEL)selector {
	NSEnumerator *setEnumerator = [self objectEnumerator];
	NSMutableSet *newSet = [NSMutableSet setWithCapacity:self.count];
	id object = nil;
	
	while ((object = [setEnumerator nextObject])) {
		if (![object performSelector:selector])
			[newSet addObject:object];
	}
	
	return newSet;
}

- (NSSet*) subsetConformingTo: (SEL)selector withObject: (id)arg {
	NSEnumerator *setEnumerator = [self objectEnumerator];
	NSMutableSet *newSet = [NSMutableSet setWithCapacity:self.count];
	id object = nil;
	
	while ((object = [setEnumerator nextObject])) {
		if ([object performSelector:selector withObject:arg])
			[newSet addObject:object];
	}
	
	return newSet;
}

- (NSSet*) subsetNotConformingTo: (SEL)selector withObject: (id)arg {
	NSEnumerator *setEnumerator = [self objectEnumerator];
	NSMutableSet *newSet = [NSMutableSet setWithCapacity:self.count];
	id object = nil;
	
	while ((object = [setEnumerator nextObject])) {
		if (![object performSelector:selector withObject:arg])
			[newSet addObject:object];
	}
	
	return newSet;
}

@end

#pragma clang diagnostic pop
