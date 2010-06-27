//
//  SWFilteringTreeController.m
//
//  Created by James G. Speth on 4/8/06.
//  http://end.com/speth
//

#import "SWFilteringTreeController.h"
#include <stdlib.h>

NSMapTable *proxies = nil;
NSMapTable *predicates = nil;

static void initStorage(void) {
    if (!proxies) {
        proxies = NSCreateMapTable(NSNonOwnedPointerMapKeyCallBacks, NSObjectMapValueCallBacks, 16);
		predicates = NSCreateMapTable(NSNonOwnedPointerMapKeyCallBacks, NSObjectMapValueCallBacks, 16);
    }
}


@implementation SWPredicateProxy

+ (void)initialize {
    initStorage();
}

+ (id)proxyWithObject:(id)object {
	initStorage();
	
	SWPredicateProxy *proxy = NSMapGet(proxies, (void*)object);
    if (!proxy) {
        proxy = [[SWPredicateProxy alloc] initWithObject:object];

		/* Store a proxy for this object */
		NSMapInsertKnownAbsent(proxies, (void*)object, (void*)proxy);
    }
	
    [proxy setPredicate:nil];
	
    return proxy;
}

- (unsigned) count {
	return [_object count];
}

- (id)initWithObject:(id)object {
    self = [super init];
	
	if (self)
        _object = [object retain];
	
    return self;
}

- (id)valueForUndefinedKey:(NSString *)key {
	initStorage();
	
    if (![self predicate]) {
		// Need to extract pointer from key
		NSString *ptrKey = [key substringWithRange:NSMakeRange(1, [key length] - 2)];
		
		void * key = NULL;
		sscanf([ptrKey UTF8String], "%p", &key);

		NSPredicate *pred = NSMapGet(predicates, key);
		
		[self setPredicate:pred];
		
        return self;
    }
	
    id filtered = [[_object valueForKey:key] filteredArrayUsingPredicate:[self predicate]];

	NSLog (@"Filtered: %@", filtered);
	
	return filtered;
}

- (NSPredicate *)predicate {
    return [[predicate retain] autorelease];
}

- (void)setPredicate:(NSPredicate *)newPredicate {
    if (predicate != newPredicate) {
        [predicate release];
        predicate = [newPredicate retain];
    }
}

@end


@implementation NSObject (SWFilteringTreeController)

- (SWPredicateProxy *)predicateProxy {
    return [SWPredicateProxy proxyWithObject:self];
}

@end


@implementation SWFilteringTreeController

- (NSPredicate *)filterPredicate {
    return [[filterPredicate retain] autorelease];
}

- (void)setFilterPredicate:(NSPredicate *)newPredicate {
	initStorage();
	
    if (![filterPredicate isEqualTo:newPredicate]) {
        [filterPredicate release];
        filterPredicate = [newPredicate retain];
		
		void * key = (void*)self;
		NSMapInsertIfAbsent(predicates, key, (void*)newPredicate);
        
        [self updateChildrenKeyPath];
    }
}

- (void)setChildrenKeyPath:(NSString *)key {
    if (realChildrenKeyPath != key) {
        [realChildrenKeyPath release];
        realChildrenKeyPath = [key retain];
        
        [self updateChildrenKeyPath];
    }
}

- (void)updateChildrenKeyPath {
    id content = [[self content] retain];
    NSArray *paths = [[self selectionIndexPaths] retain];
    [self setSelectionIndexPaths:nil];
    [self setContent:nil];
    
    if ([self filterPredicate]) {
		// %qu is unsigned long long - ie 64 bit for compatibility with 64 bit platforms
		NSString *proxyKeyPath = [NSString stringWithFormat:@"%@.%@.%@", @"predicateProxy", [NSString stringWithFormat:@"P%pP", self], realChildrenKeyPath];
		NSLog (@"Proxy Key Path: %@", proxyKeyPath);
		[super setChildrenKeyPath:proxyKeyPath];
	} else
        [super setChildrenKeyPath:realChildrenKeyPath];
    
    [self setContent:content];
    [self setSelectionIndexPaths:paths];
    [content release];
    [paths release];
}

@end

