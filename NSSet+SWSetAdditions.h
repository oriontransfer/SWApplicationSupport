//
//  NSSet+SWSetAdditions.h
//  Property Manager
//
//  Created by Sammi Williams on 27/07/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NSSet (SWSetAdditions)

/* 
	Returns a subset containing only those that satisfy the requirements
*/

- (NSSet*) subsetConformingTo: (SEL)selector;
- (NSSet*) subsetNotConformingTo: (SEL)selector;

- (NSSet*) subsetConformingTo: (SEL)selector withObject: (id)arg;
- (NSSet*) subsetNotConformingTo: (SEL)selector withObject: (id)arg;

@end
