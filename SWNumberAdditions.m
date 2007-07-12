//
//  SWNumberAdditions.m
//  Property Manager
//
//  Created by Sammi Williams on 21/07/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import "SWNumberAdditions.h"


@implementation NSDecimalNumber (SWDecimalNumberAdditions)

+ (NSDecimalNumber*) decimalNumberWithInt: (int)value {
	return [[[NSDecimalNumber alloc] initWithInt:value] autorelease];
}

+ (NSDecimalNumber*) decimalNumberWithFloat: (float)value {
	return [[[NSDecimalNumber alloc] initWithFloat:value] autorelease];

}


@end
