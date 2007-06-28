//
//  SWFlowLayout.h
//  Receipt Manager
//
//  Created by Sammi Williams on 27/02/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

typedef enum {
	NO_SPRING = 0,
	SPRING_LEFT = 1,
	SPRING_RIGHT = 2,
	SPRING_BOTH = 3
} SWFlowLayoutSpring;

@interface SWFlowLayout : NSView {
	/* Sizing */
	NSSize minimum;
	int padding;
	int spring;
	Boolean singleColumn;
	
	/* View Details */
	NSSize lastSize;
	int elementCount;
	unsigned int gridStyleMask;
	
	/* View Configuartion */
	NSColor *backgroundColor;
}

- (void) setBackgroundColor: (NSColor*) newColor;
- (NSColor*) backgroundColor;

- (void) setGridStyleMask: (unsigned int)newStyleMask;
- (unsigned int) gridStyleMask;

- (void) setGridColor: (NSColor*) newColor;
- (NSColor*) gridColor;

@end
