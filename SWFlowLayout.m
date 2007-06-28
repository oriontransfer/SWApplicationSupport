//
//  SWFlowLayout.m
//  Receipt Manager
//
//  Created by Sammi Williams on 27/02/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import "SWFlowLayout.h"


@implementation SWFlowLayout

- (id)initWithFrame:(NSRect)frame {
    if (self = [super initWithFrame:frame]) {
		self->gridColor = nil;
		self->gridStyleMask = 0;
		self->backgroundColor = nil;
    }
    return self;
}

- (void) awakeFromNib {
	NSScrollView *sv;
	
	if (sv = [self enclosingScrollView]) {
		NSSize contentSize = [sv contentSize];
		[self setFrameSize: contentSize];
		[self setAutoresizingMask: NSViewWidthSizable | NSViewHeightSizable];
	}
}

#pragma mark Getters/Setters

- (void) setBackgroundColor: (NSColor*) newColor {
	[self->backgroundColor release];
	self->backgroundColor = [newColor copy];
}

- (NSColor*) backgroundColor {
	return [[self->backgroundColor retain] autorelease];
}


- (void) setGridStyleMask: (unsigned int)newStyleMask {
	self->gridStyleMask = newStyleMask;
}

- (unsigned int) gridStyleMask {
	return self->gridStyleMask;
}


- (void) setGridColor: (NSColor*) newColor {
	[self->gridColor release];
	self->gridColor = [newColor copy];
}

- (NSColor*) gridColor {
	return [[self->gridColor retain] autorelease];
}

#pragma mark Drawing Code

- (void)drawRect:(NSRect)rect {
    // Drawing code here.
}

@end
