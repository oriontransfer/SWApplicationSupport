//
//  NSObject+BindingPropagation.h
//  Truth Tables
//
//  Created by Samuel Williams on 20/11/11.
//  Copyright (c) 2011 Orion Transfer Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (BindingPropagation)

-(void) propagateValue:(id)value forBinding:(NSString*)binding;

@end
