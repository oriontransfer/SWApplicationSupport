//
//  SWFixedPopUpButtonCell.m
//  Property Manager
//
//  Created by Samuel Williams on 20/04/13.
//  Copyright (c) 2013 Orion Transfer Ltd. All rights reserved.
//

#import "SWFixedPopUpButtonCell.h"

@implementation SWFixedPopUpButtonCell

- (void)setTitle:(NSString *)aString
{
}

- (void)setFixedTitle:(NSString *)fixedTitle
{
	self.usesItemFromMenu = NO;
	self.menuItem = [[NSMenuItem alloc] initWithTitle:@"Open Recent" action:nil keyEquivalent:@""];

	[super setTitle:fixedTitle];
}

@end
