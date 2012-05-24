//
//  NSManagedObject (SWChangeNotificationAddition).m
//  Property Manager
//
//  Created by Sammi on 23/10/05.
//  Copyright 2005 Orion Transfer Ltd. All rights reserved.
//

#import "SWChangeNotificationAdditions.h"

@implementation NSObject (SWChangeNotificationAdditions)

- (void) willChangeValueForKeys: (NSArray*)depends {
	id obj, iter = [depends objectEnumerator];
	while ((obj = [iter nextObject]) != nil) {
		[self willChangeValueForKey:obj];
	}
}

- (void) didChangeValueForKeys: (NSArray*)depends {
	id obj, iter = [depends objectEnumerator];
	while ((obj = [iter nextObject]) != nil) {
		[self didChangeValueForKey:obj];
	}	
}

@end
