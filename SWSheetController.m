//
//  PMDisplaySheet.m
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 10/07/05.
//  Copyright 2005 Samuel Williams. All rights reserved.
//

#import "SWSheetController.h"

const NSInteger SWSheetCancelled = -1;
const NSInteger SWSheetProcessed = 0;

@implementation SWSheetController

@synthesize sheet, parent, delegate;

- (IBAction)showSheet: (id)sender {
    if (!sheet)
        [self loadSheet];
    
    NSAssert(sheet != nil, @"Sheet was not loaded or set correctly!");
    
	[NSApp beginSheet: [self sheet]
	   modalForWindow: parent
		modalDelegate: self
	   didEndSelector: @selector(sheetDidEnd:returnCode:contextInfo:)
		  contextInfo: nil];
}

- (IBAction)cancelSheet: (id) sender {
	[NSApp endSheet:[self sheet] returnCode:-1];
}

- (IBAction)processSheet: (id) sender {
	[NSApp endSheet:[self sheet] returnCode:0];
}

- (void)sheetDidEnd:(NSWindow *)_sheet returnCode:(int)returnCode contextInfo:(void *)contextInfo {	
	[sheet orderOut:self];
	
    if ([delegate respondsToSelector:@selector(sheetController:didEndWithResult:)])
		[delegate sheetController:self didEndWithResult:returnCode];
}

- (id) init {
	if (self = [super init]) {

	}
	
	return self;
}

- (NSString*) nibName {
	return nil;
}

- (void) loadSheet {
	NSString* nibName = [self nibName];
	
	if (sheet == nil && nibName) {
		BOOL result = [NSBundle loadNibNamed:[self nibName] owner:self];
		
		NSAssert(result == YES, ([NSString stringWithFormat:@"Could not load sheet nib %@", [self nibName]]));
	}
}

- (id)document {
	if (parent) {
		id windowController = [parent windowController];
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
