//
//  SWTransparentTableView.h
//  Property Manager
//
//  Created by Sammi Williams on 20/06/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface SWTransparentTableView : NSTableView

- (void)awakeFromNib;
- (BOOL)isOpaque;
- (void)drawBackgroundInClipRect:(NSRect)clipRect;

@end

@interface SWTransparentOutlineView : NSOutlineView

- (void)awakeFromNib;
- (BOOL)isOpaque;
- (void)drawBackgroundInClipRect:(NSRect)clipRect;

@end
