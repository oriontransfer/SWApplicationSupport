//
//  NSMenuItem+SWShowHideAdditions.m
//  Property Manager
//
//  Created by Sammi Williams on 24/06/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import "NSMenuItem+SWShowHideAdditions.h"


@implementation NSMenu (SWShowHideAdditions)

- (void) updateTaggedItem: (int)tag withTitle:(NSString*)postfix isHidden: (BOOL)hidden {
	NSMenuItem *item = [self itemWithTag:tag];
	
	[item updateTitle:postfix isHidden:hidden];
}

@end

@implementation NSMenuItem (SWShowHideAdditions)

- (void) updateTitle:(NSString*)postfix isHidden: (BOOL)hidden {
	NSString *prefix;
	NSString *title;
	
	if (hidden)
		prefix = @"Show";
	else
		prefix = @"Hide";
	
	title = [NSString stringWithFormat:@"%@ %@", prefix, postfix];
	
	[self setTitle:title];
}

@end