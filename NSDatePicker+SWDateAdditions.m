//
//  NSDatePicker+SWDateAdditions.m
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Administrator on 15/11/07.
//  Copyright 2007 Samuel Williams. All rights reserved.
//

#import "NSDatePicker+SWDateAdditions.h"


@implementation NSDatePicker (SWDateAdditions)

- (IBAction) setToCurrentDate: (id)sender {
	[self setDateValue:[NSDate new]];
}

@end
