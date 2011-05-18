//
//  NSComboBox+SWBindingsAdditions.m
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 27/07/06.
//  Copyright 2006 Samuel Williams. All rights reserved.
//

#import "NSComboBox+SWBindingsAdditions.h"


@implementation NSComboBox (SWBindingsAdditions)

- (id) selectedObjectInArray: (id)collection {
	int index = [self indexOfSelectedItem];
	NSLog (@"Index: %d", index);
	
	NSArray *array = nil;
	
	if (index == -1) {
		// We need to match by string value
		index = [self indexOfItemWithObjectValue:[self stringValue]];
	}
	
	// If index is still -1
	if (index == -1) return nil;
	
	if ([collection isKindOfClass:[NSArray class]])
		array = collection;
	else if ([collection isKindOfClass:[NSArrayController class]])
		array = [collection content];

	NSAssert (array != nil, @"Cannot get selection from collection.. it isn't an array or an array controller");
	
	return [array objectAtIndex:index];
}

@end
