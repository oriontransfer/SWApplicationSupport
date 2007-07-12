//
//  NSManagedObject (SWChangeNotificationAddition).h
//  Property Manager
//
//  Created by Sammi on 23/10/05.
//  Copyright 2005 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NSManagedObject (SWChangeNotificationAdditions)

+ (void) setKeys:(NSArray *)keys triggerChangeNotificationsForDependentKeys: (NSArray *)dependants;

@end

@interface NSObject (SWChangeNotificationAdditions)

- (void) willChangeValueForKeys: (NSArray*)depends;
- (void) didChangeValueForKeys: (NSArray*)depends;

@end
