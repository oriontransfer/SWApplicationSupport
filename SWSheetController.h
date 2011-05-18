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

- (id) init;
/* Override this to return the name of the nib that contains the sheet */
- (NSString*) nibName;
- (id) sheet;

- (IBAction) showSheet: (id)sender;
- (IBAction) cancelSheet: (id) sender;
- (IBAction) processSheet: (id) sender;
- (void) sheetDidEnd:(NSWindow *)sheet returnCode:(int)returnCode contextInfo:(void *)contextInfo;

/* Convenience function */
- (id)document;

//@property(assign) id delegate;

- (void) setDelegate: (id)delegate;
- (id) delegate;


@end

@interface NSObject (SWSheetControllerDelegate)

- (void) sheetController: (SWSheetController*)controller didEndWithResult:(int) result;

@end