//
//  SWNumberAdditions.m
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 21/07/06.
//  Copyright 2006 Samuel Williams. All rights reserved.
//

#import "SWNumberAdditions.h"


@implementation NSDecimalNumber (SWDecimalNumberAdditions)

+ (NSDecimalNumber*) decimalNumberWithInt: (int)value {
	return [[NSDecimalNumber alloc] initWithInt:value];
}

+ (NSDecimalNumber*) decimalNumberWithFloat: (float)value {
	return [[NSDecimalNumber alloc] initWithFloat:value];

}


@end
