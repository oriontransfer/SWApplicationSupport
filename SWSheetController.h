//
//  PMDisplaySheet.h
//  Property Manager
//
//  Created by Sammi on 10/07/05.
//  Copyright 2005 Samuel Williams, Orion Transfer Ltd. All rights reserved.
//
//  This software was originally produced by Orion Transfer Ltd.
//    Please see http://www.oriontransfer.org for more details.
//

/*
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

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

@property(assign) id delegate;

@end

@interface NSObject (SWSheetControllerDelegate)

- (void) sheetController: (SWSheetController*)controller didEndWithResult:(NSInteger) result;

@end