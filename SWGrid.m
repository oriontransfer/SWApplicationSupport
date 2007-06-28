//
//  SWGrid.m
//  Super Tanks
//
//  Created by Sammi Williams on 2/06/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import "SWGrid.h"

@implementation NSData (SWGridAdditions)

- (void*) offsetTo: (NSPoint)point columns: (size_t)width datasize: (size_t)size {
	size_t rowSize = size * width;
	size_t rowOffset = point.y;
}

@end

@implementation SWGrid

@end
