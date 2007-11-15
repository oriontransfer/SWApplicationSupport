//
//  NSDatePicker+SWDateAdditions.m
//  Property Manager
//
//  Created by Administrator on 15/11/07.
//  Copyright 2007 __MyCompanyName__. All rights reserved.
//

#import "NSDatePicker+SWDateAdditions.h"


@implementation NSDatePicker (SWDateAdditions)

- (IBAction) setToCurrentDate: (id)sender {
	[self setDateValue:[NSDate new]];
}

@end
