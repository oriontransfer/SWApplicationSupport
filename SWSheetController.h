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

@class SWSheetController;

@protocol SWSheetDelegate
- (void) sheetController: (SWSheetController*)controller didEndWithResult:(NSInteger) result;
@end

@interface SWSheetController : NSObject {
	NSWindow * _sheet;
	NSWindow * _parent;
	
	bool _prepared;
	
	id __unsafe_unretained _delegate;
}

@property (nonatomic,strong) IBOutlet NSWindow * parent;
@property (nonatomic,strong) IBOutlet NSWindow * sheet;
@property (nonatomic,unsafe_unretained) id delegate;

// Override this to perform setup of the sheet before it is used:
- (void)prepareSheet;

// Ensure that the sheet is loaded:
- (void)loadSheet;

// Override this to return the name of the nib that contains the sheet
@property (nonatomic, readonly, copy) NSString *nibName;

- (IBAction) showSheet: (id)sender;

- (IBAction) cancelSheet: (id) sender;
- (IBAction) processSheet: (id) sender;
- (void) sheetDidEnd:(NSWindow *)sheet returnCode:(NSInteger)returnCode contextInfo:(void *)contextInfo;

/* Convenience function */
@property (nonatomic, readonly, strong) NSDocument *document;
@property (nonatomic, readonly, strong) NSManagedObjectContext *managedObjectContext;

@end

@interface NSObject (SWSheetControllerDelegate)
- (void) sheetController: (SWSheetController*)controller didEndWithResult:(NSInteger) result;
@end
