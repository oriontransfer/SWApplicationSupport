//
//  SWToolbar.h
//  Model Builder
//
//  Created by Sammi Williams on 21/03/06.
//  Copyright 2006 Sammi Williams. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SWToolbar : NSObject {
    IBOutlet NSWindow *window;
	NSMutableDictionary *items;
	
	NSToolbar *toolbar;
}

- (IBAction) toggle:(id)sender;
- (IBAction) customize:(id)sender;

- (void) addItem: (NSToolbarItem*)item;

/* Protected */
- (void) setupToolbar;
- (void) finishSetup;

@end

@interface NSToolbarItem (SWToolbar)

+ toolbarItemWithIdentifier: (id)identifier;
- (void) setName: (id)name andDescription: (id)description;
- (void) setTarget: (id)target andAction: (SEL)action;
- (void) setImageNamed: (id)name;

@end
