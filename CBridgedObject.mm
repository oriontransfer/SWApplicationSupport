//
//  CBridgedObject.m
//  Model Builder
//
//  Created by Sammi Williams on 28/04/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import "CBridgedObject.h"

#ifndef iterateEach
#define iterateEach(c, iter) typeof(c.begin()) iter = c.begin(); iter != c.end(); ++iter
#endif

BridgedObjectInterface::~BridgedObjectInterface () {
	
}

template <typename object_t>
NSMutableSet *setFromVector(Class bridgeClass, std::vector<object_t> vec) {
	NSMutableSet *set = [NSMutableSet set];
	
	for (iterateEach(vec, obj)) {
		[set addObject:[bridgeClass bridgedObject:obj]];
	}
	
	return set;
}

typedef std::map<BridgedObjectInterface*, id> ObjCBridgeMap;

@interface CBridgedObject (Private)

+ (ObjCBridgeMap*) bridgeMappings;

@end

@implementation CBridgedObject

+ (ObjCBridgeMap*) bridgeMappings {
	static ObjCBridgeMap* mappings = NULL;
	
	if (mappings == NULL) {
		mappings = new ObjCBridgeMap;
	}
	
	return mappings;
}

+ bridgedObject: (BridgedObjectInterface*)object {
	if (object == NULL) return nil;
	
	id result = (*[[self class] bridgeMappings])[object];
	
	if (result)
		return [result retain];
	else
		return [[[self class] alloc] initWithObject:object];
}

- initWithObject:(BridgedObjectInterface*)object {
	if (self = [super init]) {		
		__object = object;
		
		(*[[self class] bridgeMappings])[object] = self;
	}
	
	return self;
}

- init {
	if (self = [super init]) {
		[self release];		
	}
	
	return nil;
}

- (BridgedObjectInterface*) object {
	return __object;
}

- (void) dealloc {
	[super dealloc];
	
	if (__object) {
		[[self class] bridgeMappings]->erase(__object);
		delete __object;
	}
}

@end
