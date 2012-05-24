//
//  NSManagedObject (SWChangeNotificationAddition).h
//  Property Manager
//
//  Created by Sammi on 23/10/05.
//  Copyright 2005 Orion Transfer Ltd. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSObject (SWChangeNotificationAdditions)

- (void) willChangeValueForKeys: (NSArray*)depends;
- (void) didChangeValueForKeys: (NSArray*)depends;

@end
