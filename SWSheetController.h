//
//  PMDisplaySheet.h
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 10/07/05.
//  Copyright 2005 Samuel Williams. All rights reserved.
//

#import <Cocoa/Cocoa.h>

/* This controller can be used to connect two separate NIBs together */

const NSInteger SWSheetCancelled;
const NSInteger SWSheetProcessed;

@interface SWSheetController : NSObject {
	IBOutlet NSWindow *sheet;
	IBOutlet NSWindow *parent;
		
	id delegate;
}

@property(nonatomic,retain) NSWindow * sheet;
@property(nonatomic,retain) NSWindow * parent;
@property(assign) id delegate;

- (id) init;

// Used internally to load the sheet from a NIB file if it hasn't been explicitly set.
- (void) loadSheet;
// Override this to return the name of the nib that contains the sheet.
- (NSString*) nibName;

- (IBAction) showSheet: (id)sender;
- (IBAction) cancelSheet: (id) sender;
- (IBAction) processSheet: (id) sender;

// Callback
- (void) sheetDidEnd:(NSWindow *)sheet returnCode:(int)returnCode contextInfo:(void *)contextInfo;

// Convenience function
- (id)document;
- (id)managedObjectContext;

@end

@interface NSObject (SWSheetControllerDelegate)

- (void) sheetController: (SWSheetController*)controller didEndWithResult:(int) result;

@end