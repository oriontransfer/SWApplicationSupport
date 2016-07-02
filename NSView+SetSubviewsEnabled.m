//
//  NSBox (SWEnabledAddition).m
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 20/10/05.
//  Copyright 2005 Samuel Williams. All rights reserved.
//

#import "NSView+SetSubviewsEnabled.h"

@interface NSView (SWEnabledAdditionPrivate)
- (void) recursivelySetEnabled: (BOOL)enabled;
@end

@implementation NSView (SWEnabledAddition)

- (void) setSubviewsEnabled: (BOOL)enabled {
	[self recursivelySetEnabled:enabled];
}

- (void) recursivelySetEnabled: (BOOL)enabled {
	NSArray *subviews = self.subviews;
	NSEnumerator *iter = [subviews objectEnumerator];
	id childView;
	
	while ((childView = [iter nextObject])) {
		//NSLog (@"%@", childView);
		if ([childView respondsToSelector:@selector(setEnabled:)])
			[childView setEnabled:enabled];
		
		if ([childView respondsToSelector:@selector(recursivelySetEnabled:)])
			[childView recursivelySetEnabled:enabled];
	}
}

@end
