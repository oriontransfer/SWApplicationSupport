//
//  SWSidebarView.h
//  Property Manager
//
//  Created by Sammi Williams on 19/06/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "SWGradientFillAdditions.h"
#import "SWImageAdditions.h"
#import "SWOutlineViewAdditions.h"

@interface SWSidebarView : NSView {
	NSOutlineView *contentView;
}

@end

/* Dummy class to indicate cell to be replaced with SWSidebarButtonCell */
@interface SWSidebarButton : NSButton {
	
}

@end

@interface SWSidebarPopUpButton : NSPopUpButton {
	
}

@end

@interface SWSidebarPopUpButtonCell : NSPopUpButtonCell {
	
}

@end

@interface SWSidebarButtonCell : NSButtonCell {
	
}

@end
