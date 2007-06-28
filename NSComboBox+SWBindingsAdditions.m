//
//  NSComboBox+SWBindingsAdditions.m
//  Property Manager
//
//  Created by Sammi Williams on 27/07/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import "NSComboBox+SWBindingsAdditions.h"


@implementation NSComboBox (SWBindingsAdditions)

- (id) selectedObjectInArray: (id)collection {
	int index = [self indexOfSelectedItem];
	NSArray *array = nil;
	
	if (index == -1) return nil;
	
	if ([collection isKindOfClass:[NSArray class]])
		array = collection;
	else if ([collection isKindOfClass:[NSArrayController class]])
		array = [collection content];

	NSAssert (array != nil, @"Cannot get selection from collection.. it isn't an array or an array controller");
	
	return [array objectAtIndex:index];
}

@end
