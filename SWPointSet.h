//
//  PointSet.h
//  Asteroid Miner
//
//  Created by Sammi on 13/05/05.
//  Copyright 2005 Sammi Williams. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#include "SWPoint.h"

@interface NSIndexSet (SWMathematicsOperatorsAddition) 

- (NSIndexSet*) intersectWithIndexSet: (NSIndexSet*)set;
- (NSIndexSet*) unionWithIndexSet: (NSIndexSet*)set;
- (NSIndexSet*) invertWithinRange: (NSRange)range;

@end

@interface SWPointSet : NSObject {
	NSMutableIndexSet	*indexSet;
	SWSize size;
}

+ (SWPoint) pointForIndex:(unsigned int)index withSize:(SWSize)size;
+ (unsigned int) indexForPoint:(SWPoint)point withSize:(SWSize)size;

/* Simple Constructor*/
+ (id) pointSetWithSize: (SWSize)size;

- (id) initWithSize:(SWSize)size;

- (NSIndexSet*) indexSet;

- (BOOL) containsPoint:(SWPoint)point;

- (SWPoint) pointForIndex:(unsigned int)index;
- (unsigned int) indexForPoint:(SWPoint)point;

- (SWPointSet*) intersectWithPointSet: (SWPointSet*)set;
- (SWPointSet*) subtractPointSet: (SWPointSet*)set;
- (SWPointSet*) unionWithPointSet: (SWPointSet*)set;
- (SWPointSet*) inversePointSet;

- (size_t) count;
@end

@interface SWMutablePointSet : SWPointSet {

}
- (void) addPoint:(SWPoint)point;
- (void) removePoint:(SWPoint)point;

- (NSMutableIndexSet*) indexSet;

@end