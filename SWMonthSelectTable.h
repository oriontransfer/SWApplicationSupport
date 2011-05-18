//
//  SWMonthSelectTable.h
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Administrator on 4/11/07.
//  Copyright 2007 Samuel Williams. All rights reserved.
//

#import <Cocoa/Cocoa.h>

// This is both a table delegate _and_ a datasource.

@interface SWMonthSelectTable : NSObject {
	IBOutlet NSDatePicker * dateToUpdate;
}

- (IBAction) plusWeek: (id) sender;
- (IBAction) minusWeek: (id) sender;

- (NSString*) monthNameForNumber: (int)index;

- (BOOL)tableView:(NSTableView *)aTableView 
	shouldEditTableColumn:(NSTableColumn *)aTableColumn 
	row:(int)rowIndex;

- (BOOL)tableView:(NSTableView *)aTableView shouldSelectRow:(int)rowIndex;

- (id)tableView:(NSTableView *)aTableView
    objectValueForTableColumn:(NSTableColumn *)aTableColumn
    row:(int)rowIndex;

- (int)numberOfRowsInTableView:(NSTableView *)aTableView;

@end
