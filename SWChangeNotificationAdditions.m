//
//  NSManagedObject (SWChangeNotificationAddition).m
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 23/10/05.
//  Copyright 2005 Samuel Williams. All rights reserved.
//

#import "SWChangeNotificationAdditions.h"

@implementation NSManagedObject (SWChangeNotificationAddition)

+ (void) setKeys: (NSArray *)keys triggerChangeNotificationsForDependentKeys: (NSArray *)dependants {
	NSEnumerator *dependantEnum = [dependants objectEnumerator];
	id dependant;
	
	while ((dependant = [dependantEnum nextObject]) != nil) {
		//NSLog (@"setKeys: %@ triggerChangeNotificationsForDependentKey: %@", keys, dependant);
		[self setKeys: keys triggerChangeNotificationsForDependentKey: dependant];
	}
}

@end

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
