//
//  SWMapReduceExtensions.m
//  Property Manager
//
//  Created by Samuel Williams on 1/07/10.
//  Copyright 2010 Orion Transfer Ltd. All rights reserved.
//

#import "SWMapReduceExtensions.h"

@interface SWMapProxy : NSObject {
	id collection;
}

- initWithCollection: (id)collection;

@end

@implementation SWMapProxy

- initWithCollection: (id)_collection {
	if (self = [super init]) {
		collection = _collection;
	}
	
	return self;
}

// http://www.pearsoned.co.uk/bookshop/article.asp?item=1181
- (void)forwardInvocation: (NSInvocation*)anInvocation {
        SEL selector = [anInvocation selector];
        NSMutableArray *mappedArray = [NSMutableArray array];
		
        for (id object in collection) {
                if ([object respondsToSelector: selector]) {
                        [anInvocation invokeWithTarget: object];
						
                        id mapped;
                        [anInvocation getReturnValue: &mapped];
                        [mappedArray addObject: mapped];
                }
        }
		
        [anInvocation setReturnValue: mappedArray];
}

@end

@implementation NSObject (SWMapReduceExtensions)

- (id) map {
	return [[[SWMapProxy alloc] initWithCollection:self] autorelease];
}

@end
