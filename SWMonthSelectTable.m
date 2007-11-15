//
//  SWMonthSelectTable.m
//  Property Manager
//
//  Created by Administrator on 4/11/07.
//  Copyright 2007 __MyCompanyName__. All rights reserved.
//

#import "SWMonthSelectTable.h"


@implementation SWMonthSelectTable

- (NSString*) monthNameForNumber: (int)index {
	switch(index) {
		case 1: return @"January";
		case 2: return @"Febuary";
		case 3: return @"March";			
		case 4: return @"April";
		case 5: return @"May";
		case 6: return @"June";
		case 7: return @"July";
		case 8: return @"August";
		case 9: return @"September";
		case 10: return @"October";
		case 11: return @"November";
		case 12: return @"December";
	}
	
	return [NSString stringWithFormat:@"Unknown Month: %d", index];
}

- (BOOL)tableView:(NSTableView *)aTableView 
	shouldEditTableColumn:(NSTableColumn *)aTableColumn 
	row:(int)rowIndex
{
	return NO;
}

- (BOOL)tableView:(NSTableView *)aTableView shouldSelectRow:(int)rowIndex
{
	if (dateToUpdate != nil) {
		NSDate * cur = [dateToUpdate dateValue];
		NSDateComponents * cmp = [[NSCalendar currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:cur];
		[cmp setMonth: rowIndex + 1];
		NSDate * next = [[NSCalendar currentCalendar] dateFromComponents:cmp];
		
		[dateToUpdate setDateValue:next];
	}

	return YES;
}

- (IBAction) plusWeek: (id) sender {
	if (dateToUpdate != nil) {
		NSDate * cur = [dateToUpdate dateValue];
		NSDateComponents * cmp = [[NSCalendar currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit | NSWeekCalendarUnit | NSWeekdayCalendarUnit fromDate:cur];
		[cmp setWeek:[cmp week] + 1];
		NSDate * next = [[NSCalendar currentCalendar] dateFromComponents:cmp];
		
		[dateToUpdate setDateValue:next];
	}

}

- (IBAction) minusWeek: (id) sender {
	if (dateToUpdate != nil) {
		NSDate * cur = [dateToUpdate dateValue];
		NSDateComponents * cmp = [[NSCalendar currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit | NSWeekCalendarUnit | NSWeekdayCalendarUnit fromDate:cur];
		[cmp setWeek:[cmp week] - 1];
		NSDate * next = [[NSCalendar currentCalendar] dateFromComponents:cmp];
		
		[dateToUpdate setDateValue:next];
	}

}

- (id)tableView:(NSTableView *)aTableView
    objectValueForTableColumn:(NSTableColumn *)aTableColumn
    row:(int)rowIndex
{	
	if ([[aTableColumn identifier] isEqualTo:@"Number"]) {
		return [NSString stringWithFormat:@"%d", rowIndex + 1];
	} else if ([[aTableColumn identifier] isEqualTo:@"Month"]) {
		return [self monthNameForNumber: rowIndex + 1];
	}
	
	return nil;
}


- (int)numberOfRowsInTableView:(NSTableView *)aTableView {
    return 12;
}

@end
