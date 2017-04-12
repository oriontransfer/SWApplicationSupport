//
//  PMDisplaySheet.h
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 10/07/05.
//  Copyright 2005 Samuel Williams. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class SWSheetController;

@protocol SWSheetDelegate
- (void) sheetController: (SWSheetController*)controller didEndWithResult:(NSInteger) result;
@end

@interface SWSheetController : NSWindowController

@property(nonatomic,strong) IBOutlet NSWindow * parent;
@property(nonatomic,unsafe_unretained) id delegate;

// Override this to perform setup of the sheet before it is used:
- (void)prepareSheet;

// Override this to return the name of the nib that contains the sheet
- (NSString *) nibName;

- (IBAction) showSheet: (id)sender;

- (IBAction) cancelSheet: (id) sender;
- (IBAction) processSheet: (id) sender;
- (void) sheetDidEnd:(NSWindow *)sheet returnCode:(NSInteger)returnCode contextInfo:(id)contextInfo;

/* Convenience function */
- (NSManagedObjectContext *)managedObjectContext;

@end

@interface NSObject (SWSheetControllerDelegate)
- (void) sheetController: (SWSheetController*)controller didEndWithResult:(NSInteger) result;
@end
