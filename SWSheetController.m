//
//  PMDisplaySheet.m
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 10/07/05.
//  Copyright 2005 Samuel Williams. All rights reserved.
//

#import "SWSheetController.h"

// 10.5 only
const NSInteger SWSheetCancelled = -1;
const NSInteger SWSheetProcessed = 0;

@implementation SWSheetController

@synthesize parent = _parent, sheet = _sheet, delegate = _delegate;

- (IBAction)showSheet: (id)sender {
	//NSLog (@"beginSheet: %@ modalForWindow: %@ modalDelegate: %@", [self sheet], parent, self);
	[NSApp beginSheet:self.sheet modalForWindow:_parent modalDelegate:self didEndSelector:@selector(sheetDidEnd:returnCode:contextInfo:) contextInfo:nil];
}

- (IBAction)cancelSheet: (id) sender {
	[NSApp endSheet:self.sheet returnCode:-1];
}

- (IBAction)processSheet: (id) sender {
	[NSApp endSheet:self.sheet returnCode:0];
}

- (void)sheetDidEnd:(NSWindow *)sheet returnCode:(int)returnCode contextInfo:(void *)contextInfo {
	NSAssert(sheet == _sheet, @"Inconsistent sheet supplied to controller.");
	
	if ([_delegate respondsToSelector:@selector(sheetController:didEndWithResult:)])
		[_delegate sheetController:self didEndWithResult:returnCode];
	
	[_sheet close];
}

- (void) prepareSheet {
	
}

- (void) loadSheet {
	if (_sheet == nil) {
		NSString* nibName = [self nibName];
		
		if (nibName) {
			BOOL result = [NSBundle loadNibNamed:[self nibName] owner:self];
			
			NSAssert(result == YES, ([NSString stringWithFormat:@"Could not load sheet nib %@", [self nibName]]));
		}
	}
	
	if (!_prepared) {
		_prepared = YES;
		
		[self prepareSheet];
	}
}

- (NSString *) nibName {
	return nil;
}

- (NSWindow *) sheet {	
	[self loadSheet];
	
	return _sheet;
}

- (id)document {
	if (_parent) {
		id windowController = [_parent windowController];
		
		if (windowController) {
			id document = [windowController document];
			
			return document;
		}
	}
	
	return nil;
}

- (id)managedObjectContext {
	id document = [self document];
	
	if (document)
		return [document managedObjectContext];
	else
		return nil;
}

@end
