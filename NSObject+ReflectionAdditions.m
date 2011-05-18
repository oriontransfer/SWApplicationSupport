//
//  ObjectSubclassesAddition.m
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 2/06/05.
//  Copyright 2005 Samuel Williams. All rights reserved.
//

#import "NSObject+ReflectionAdditions.h"
#import <objc/objc-runtime.h>

@implementation NSObject (ReflectionAdditions)

+ (NSArray*) subclasses {
    NSMutableArray		*subclasses;
    struct objc_class	*superClass;
    Class				*classes = NULL;
    Class				*current;
	const Class			thisClass = [self class];
    int					count, index;

    subclasses = [[NSMutableArray alloc] initWithCapacity:12];

	count = objc_getClassList(NULL, 0);
		
	if (count) {
		classes = malloc(sizeof(Class) * count);
		NSAssert (classes != NULL, @"Memory Allocation Failed in [NSObject +subclasses].");

		(void) objc_getClassList(classes, count);
	}

	if (classes) {
		current = classes;

		for (index = 0; index < count; ++index, ++current) {
			superClass = *current;
			while (superClass = (superClass)->super_class)
				if (superClass == thisClass) {
					[subclasses addObject:*current];
					break;
				}
		}

		free(classes);
	}

    return subclasses;
}

+ (Class) classWithName: (NSString*)clsName {
	id obj;
	
	obj = objc_lookUpClass([clsName cString]);

	return obj;
}

@end
