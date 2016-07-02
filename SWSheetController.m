//
//  PMDisplaySheet.m
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 10/07/05.
//  Copyright 2005 Samuel Williams. All rights reserved.
//

#import "SWSheetController.h"

@implementation SWSheetController

- (IBAction)showSheet: (id)sender {
	NSAssert(self.window != nil, @"Sheet outlet must be set before showing sheet!");
	NSAssert(self.parent != nil, @"Parent outlet must be set before showing sheet!");

	[self.parent beginSheet:self.window completionHandler:^(NSModalResponse returnCode) {
		[self sheetDidEnd:self.window returnCode:returnCode contextInfo:sender];
	}];
}

- (IBAction)cancelSheet: (id) sender {
	[self.parent endSheet:self.window returnCode:-1];
}

- (IBAction)processSheet: (id) sender {
	[self.parent endSheet:self.window returnCode:0];
}

- (void)sheetDidEnd:(NSWindow *)sheet returnCode:(NSInteger)returnCode contextInfo:(id)contextInfo {
	NSAssert(sheet == self.window, @"Inconsistent sheet supplied to controller.");

	[self close];

	if ([_delegate respondsToSelector:@selector(sheetController:didEndWithResult:)])
		[_delegate sheetController:self didEndWithResult:returnCode];

	if (contextInfo && [contextInfo conformsToProtocol:@protocol(SWSheetDelegate)])
		[contextInfo sheetController:self didEndWithResult:returnCode];
}

- (void) prepareSheet {
}

- (NSString *)nibName {
	NSLog(@"Warning: SWSheetController#nibName not implemented!");
	
	return nil;
}

- (NSString *)windowNibName {
	return [self nibName];
}

- (void)windowDidLoad
{
	[self prepareSheet];
}

- (id)document {
	if (self.parent) {
		id windowController = (self.parent).windowController;
		
		if (windowController) {
			id document = [windowController document];
			
			return document;
		}
	} else {
		NSLog(@"Trying to get document but no parent specified!");
	}
	
	return nil;
}

- (id)managedObjectContext {
	id document = self.document;
	
	if (document)
		return [document managedObjectContext];
	else
		return nil;
}

@end
