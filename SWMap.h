//
//  SWMap.h
//  Asteroid Miner
//
//  Created by Sammi on 13/05/05.
//  Copyright 2005 Orion Transfer Ltd. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SWMap : NSObject {
	NSMutableArray *objects;
	
	NSSize size;
}
//don't use -init;
- (id) initWithSize:(NSSize)size;

- (id) objectAtPoint:(NSPoint)point;
- (bool) validPoint:(NSPoint)point;
- (NSSize) size;

@end

@interface SWMutableMap : SWMap {

}

- (void) replaceObjectAtPoint:(NSPoint)point withObject:object;

@end
