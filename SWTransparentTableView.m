//
//  SWTransparentTableView.m
//  Property Manager
//
//  Created by Sammi Williams on 20/06/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import "SWTransparentTableView.h"


@implementation SWTransparentTableView

- (void)awakeFromNib {
	[super awakeFromNib];

    [[self enclosingScrollView] setDrawsBackground: NO];
}

- (BOOL)isOpaque {
    return NO;
}

- (void)drawBackgroundInClipRect:(NSRect)clipRect {
	
    // don't draw a background rect
}

@end

@implementation SWTransparentOutlineView

- (void)awakeFromNib {
	
    [[self enclosingScrollView] setDrawsBackground: NO];
}

- (BOOL)isOpaque {
    return NO;
}

- (void)drawBackgroundInClipRect:(NSRect)clipRect {
	
    // don't draw a background rect
}

@end
