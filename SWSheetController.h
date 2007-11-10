//
//  PMDisplaySheet.h
//  Property Manager
//
//  Created by Sammi on 10/07/05.
//  Copyright 2005 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

/* This controller can be used to connect two separate NIBs together */

@interface SWSheetController : NSObject {
	IBOutlet NSWindow *sheet;
	IBOutlet NSWindow *parent;
	
	BOOL nibLoaded;
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

@end

/* Compatibility */

@interface SWDisplaySheet : SWSheetController {
	
}

@end