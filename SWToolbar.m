//
//  SWToolbar.m
//  Model Builder
//
//  Created by Sammi Williams on 21/03/06.
//  Copyright 2006 Sammi Williams. All rights reserved.
//

#import "SWToolbar.h"

@implementation SWToolbar

- (IBAction) toggle:(id)sender { 
    [[window toolbar] setVisible:![[window toolbar] isVisible]]; 
}

- (IBAction) customize:(id)sender { 
    [[window toolbar] runCustomizationPalette:sender]; 
}

- (id) toolbarIdentifier {
	return nil;
}

- (void) setupToolbar {
	toolbar = [[NSToolbar alloc] initWithIdentifier:[self toolbarIdentifier]];
	
	[toolbar setDelegate:self];
	[toolbar setAllowsUserCustomization:YES];
	[toolbar setAutosavesConfiguration:YES];
}

- (void) addDefaultItems {
	[items setValue:self forKey:NSToolbarFlexibleSpaceItemIdentifier];
	[items setValue:self forKey:NSToolbarSpaceItemIdentifier];
	[items setValue:self forKey:NSToolbarSeparatorItemIdentifier];
}

- (void) finishSetup {
	[window setToolbar:toolbar];
}

- (id) init {
	if (self = [super init]) {
		items = [[NSMutableDictionary alloc] init];
	}
	
	return self;
}

- (void) dealloc {
	[items release];
	
	[super dealloc];
}

- (NSToolbarItem *)toolbar:(NSToolbar *)toolbar itemForItemIdentifier:(NSString *)itemIdentifier willBeInsertedIntoToolbar:(BOOL)flag {
    return [items objectForKey:itemIdentifier];
}

- (NSArray *) toolbarAllowedItemIdentifiers:(NSToolbar*)toolbar {
    return [items allKeys];
}

- (NSArray *) toolbarDefaultItemIdentifiers:(NSToolbar*)toolbar {
	NSArray *keys = [items allKeys];
	
	return keys;
}

- (void) toolbarWillAddItem: (NSNotification *) notification {
    //NSToolbarItem *addedItem = [[notification userInfo] objectForKey:@"item"];
	
    // set up the item here
}

- (void) toolbarDidRemoveItem:(NSNotification *)notification {
    //NSToolbarItem *addedItem = [[notification userInfo] objectForKey:@"item"];
	
    // clear associated info here 
}

- (void) addItem: (NSToolbarItem*)item {
	[items setValue:item forKey:[item itemIdentifier]];
}

@end

@implementation NSToolbarItem (SWToolbar)

+ (NSToolbarItem*) toolbarItemWithIdentifier: (id)identifier {
	return [[[self class] alloc] initWithItemIdentifier:identifier];
}

- (NSToolbarItem*) setName: (id)name andDescription: (id)description {
	[self setLabel:name];
	[self setPaletteLabel:name];
	[self setToolTip:description];
	return self;
}

- (NSToolbarItem*) setTarget: (id)target andAction: (SEL)action {
	[self setTarget:target];
	[self setAction:action];
	return self;
}

- (NSToolbarItem*) setImageNamed: (id)name {
	[self setImage:[NSImage imageNamed:name]];
	return self;
}

@end
