//
//  NSBox (SWEnabledAddition).m
//  Telephone Operator
//
//  Created by Sammi on 20/10/05.
//  Copyright 2005 __MyCompanyName__. All rights reserved.
//

#import "NSBox+SetSubviewsEnabled.h"


@implementation NSBox (SWEnabledAddition)
- (void) recursivelySetEnabled: (BOOL)enabled forView: (id)view {
	NSArray *subviews = [view subviews];
	NSEnumerator *iter = [subviews objectEnumerator];
	id childView;
	
	while (childView = [iter nextObject]) {
		//NSLog (@"%@", childView);
		if ([childView respondsToSelector:@selector(setEnabled:)]) {
			[childView setEnabled:enabled];
		}
		[self recursivelySetEnabled:enabled forView:childView];
	}
}

- (void) setSubviewsEnabled: (BOOL)enabled {
	[self recursivelySetEnabled:enabled forView:self];
}

@end
