//
//  SWTreeControllerAdditions.h
//  Property Manager
//
//  Created by Sammi Williams on 24/06/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSOutlineView (SWOutlineViewAdditions)

+ originalItem: (id)item;

- (id)originalItemAtRow:(int)row;
- (int)rowForOriginalItem:(id)originalItem;

@end
