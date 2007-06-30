//
//  ObjectSubclassesAddition.h
//  Asteroid Miner
//
//  Created by Sammi on 2/06/05.
//  Copyright 2005 Orion Transfer Ltd. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSObject (ReflectionAdditions)

+ (NSArray*) subclasses;

+ (Class) classWithName: (NSString*)clsName;

@end
