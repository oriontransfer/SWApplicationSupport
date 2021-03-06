//
//  SWToolbar.h
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 21/03/06.
//  Copyright 2006 Samuel Williams. All rights reserved.
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

/* Used in subclasses awakeFromNib to setup the toolbar */
- (void) setupToolbar;
- (void) addDefaultItems; /* Spaces and lines */
- (void) finishSetup;

@end

@interface NSToolbarItem (SWToolbar)

+ (NSToolbarItem*) toolbarItemWithIdentifier: (id)identifier;
- (NSToolbarItem*) setName: (id)name andDescription: (id)description;
- (NSToolbarItem*) setTarget: (id)target andAction: (SEL)action;
- (NSToolbarItem*) setImageNamed: (id)name;

@end
