//
//  NSManagedObject (SWChangeNotificationAddition).h
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 23/10/05.
//  Copyright 2005 Samuel Williams. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSObject (SWChangeNotificationAdditions)

- (void) willChangeValueForKeys: (NSArray*)depends;
- (void) didChangeValueForKeys: (NSArray*)depends;

@end
