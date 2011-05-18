//
//  ObjectSubclassesAddition.h
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 2/06/05.
//  Copyright 2005 Samuel Williams. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSObject (ReflectionAdditions)

+ (NSArray*) subclasses;

+ (Class) classWithName: (NSString*)clsName;

@end
