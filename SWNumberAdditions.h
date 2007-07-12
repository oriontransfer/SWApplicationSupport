//
//  SWNumberAdditions.h
//  Property Manager
//
//  Created by Sammi Williams on 21/07/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NSDecimalNumber (SWDecimalNumberAdditions)

+ (NSDecimalNumber*) decimalNumberWithInt: (int)value;
+ (NSDecimalNumber*) decimalNumberWithFloat: (float)value;

@end
