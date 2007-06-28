//
//  SWGrid.h
//  Super Tanks
//
//  Created by Sammi Williams on 2/06/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSData (SWGridAdditions)
- (void*) offsetTo: (NSPoint)point columns: (size_t)width datasize: (size_t)size;
@end

typedef enum {
	SW_GRID_BYTES = 1,
	SW_GRID_INTEGERS = 4,
} SWGridDatatype;

@interface SWGrid : NSObject {
	NSData *data;
	
}

+ gridWithSize: (NSSize)size;
- initWithSize: (NSSize)size;

@end
