//
//  SWSidebarView.m
//  Property Manager
//
//  Created by Sammi Williams on 19/06/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import "SWSidebarView.h"

void _swDrawToolbar (NSRect viewBounds, float scale) {
	const float LOWER_HEIGHT = 12.0;
	const float UPPER_HEIGHT = 10.0;
	const float COMBINED_HEIGHT = LOWER_HEIGHT + UPPER_HEIGHT;
	
	NSRect lower, upper;
		
	lower.origin.x = 0.0;
	lower.origin.y = 0.0;
	lower.size.width = viewBounds.size.width;
	lower.size.height = LOWER_HEIGHT;
	
	upper.origin.x = 0.0;
	upper.origin.y = LOWER_HEIGHT;
	upper.size.width = viewBounds.size.width;
	upper.size.height = UPPER_HEIGHT;
	
	[[NSColor colorWithCalibratedRed:0.902 * scale green:0.902 * scale blue:0.902 * scale alpha:1.0] setFill];
	[[NSBezierPath bezierPathWithRect:lower] fill];
	
	[[NSBezierPath bezierPathWithRect:upper] 
		fillVerticalGradientTop:[NSColor colorWithCalibratedRed:0.992 * scale green:0.992 * scale blue:0.992 * scale alpha:1.0] 
						 bottom:[NSColor colorWithCalibratedRed:0.953 * scale green:0.953 * scale blue:0.953 * scale alpha:1.0]
		];
	
	NSBezierPath *upperLine = [NSBezierPath bezierPath];
	
	[[NSColor scrollBarColor] setStroke];
	
	[upperLine moveToPoint:NSMakePoint(0, COMBINED_HEIGHT + 0.5)];
	[upperLine lineToPoint:NSMakePoint(viewBounds.size.width, COMBINED_HEIGHT + 0.5)];
	
	[upperLine stroke];
	
	NSBezierPath *line = [NSBezierPath bezierPath];
	NSPoint a = {viewBounds.origin.x + viewBounds.size.width - 0.5, viewBounds.origin.y};
	NSPoint b = {viewBounds.origin.x + viewBounds.size.width - 0.5, viewBounds.origin.y + viewBounds.size.height};
	
	[line moveToPoint:a];
	[line lineToPoint:b];
	
	[[NSColor scrollBarColor] setStroke];
	
	[line stroke];	
}

@implementation SWSidebarView

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
		
    }
	
    return self;
}

- (BOOL)isOpaque {
	return YES;
}

- (void) awakeFromNib {	
	NSEnumerator *subviews = [[self subviews] objectEnumerator];
	NSView *view;
	
	while (view = [subviews nextObject]) {		
		if ([view isKindOfClass:[NSScrollView class]]) {
			NSScrollView *scrollView = (NSScrollView*)view;
			
			[scrollView setDrawsBackground:NO];
			[scrollView setHasHorizontalScroller:NO];
			[scrollView setAutohidesScrollers:YES];
			[scrollView setFocusRingType:NSFocusRingTypeNone];
			[scrollView setBorderType:NSNoBorder];
			[scrollView setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
		
			if ([[scrollView documentView] isKindOfClass:[NSOutlineView class]]) {
				contentView = [scrollView documentView];
				
				// Remove the header
				//[contentView setHeaderView:nil];
			}
		}
	}
	
}

- (void)_drawToolbar {
	_swDrawToolbar([self bounds], 1.0);
}

- (void)drawRect:(NSRect)rect {
	NSRect viewBounds = [self bounds];
	NSBezierPath *p = [NSBezierPath bezierPathWithRect:viewBounds];
	NSColor *c1 = [NSColor colorWithCalibratedRed:0.901 green:0.921 blue:0.961 alpha:1.0];
	NSColor *c2 = [NSColor colorWithCalibratedRed:0.902 green:0.929 blue:0.969 alpha:1.0];
	
	[p fillHorizontalGradientLeft:c1 right:c2];
	
	NSBezierPath *line = [NSBezierPath bezierPath];
	NSPoint a = {viewBounds.origin.x + viewBounds.size.width - 0.5, viewBounds.origin.y};
	NSPoint b = {viewBounds.origin.x + viewBounds.size.width - 0.5, viewBounds.origin.y + viewBounds.size.height};
	
	[line moveToPoint:a];
	[line lineToPoint:b];
	
	[[NSColor scrollBarColor] setStroke];
		
	[self _drawToolbar];

	[line stroke];
}

@end

@implementation SWSidebarButton

- (BOOL) isFlipped {
	return NO;
}

- (void) awakeFromNib {
	NSButtonCell *oldButtonCell = (NSButtonCell*)[self cell];
	SWSidebarButtonCell *newButtonCell = [SWSidebarButtonCell new];
	
	[newButtonCell setTitle:[oldButtonCell title]];
	[newButtonCell setImage:[oldButtonCell image]];
	[newButtonCell setImagePosition:[oldButtonCell imagePosition]];
	[newButtonCell setBezelStyle:[oldButtonCell bezelStyle]];
		
	[self setCell:newButtonCell];
}

@end

@implementation SWSidebarButtonCell

- (BOOL)trackMouse:(NSEvent *)theEvent inRect:(NSRect)cellFrame 
			ofView:(NSView *)controlView untilMouseUp:(BOOL)untilMouseUp
{
	BOOL mouseIsUp = [super trackMouse:theEvent inRect:cellFrame 
								ofView:controlView untilMouseUp:untilMouseUp];
	
	NSMenu *menu = [[self controlView] menu];
	
	if (menu) {
		[NSMenu popUpContextMenu:menu withEvent:theEvent forView:[self controlView]];
	}
	
	return mouseIsUp;
}

- (void)drawBezelWithFrame:(NSRect)frame inView:(NSView*)controlView {
	float scale = 1.0;
	
	if ([self isHighlighted]) {
		scale = 0.8;
	}
	
	_swDrawToolbar (frame, scale);
}

@end
