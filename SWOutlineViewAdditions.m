//
//  SWTreeControllerAdditions.m
//  Property Manager
//
//  Created by Sammi Williams on 24/06/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import "SWOutlineViewAdditions.h"

@interface NSObject (SWOutlineViewAdditions)
- (id)observedObject;
@end

@implementation NSOutlineView (SWTreeControllerAdditions)

+ originalItem: (id)item {
	if ([item respondsToSelector:@selector(observedObject)])
		return [item observedObject];
	else
		return item;
}

- (id)originalItemAtRow:(int)row {
	id item = [self itemAtRow:row];
	
	return [NSOutlineView originalItem:item];
}

- (int)rowForOriginalItem:(id)originalItem {
	int numberOfRows = [self numberOfRows];
	int row;
	
	for(row=0; row<numberOfRows; row++)
		if([self originalItemAtRow:row] == originalItem)
			return row;
	
	return -1;
}

@end
