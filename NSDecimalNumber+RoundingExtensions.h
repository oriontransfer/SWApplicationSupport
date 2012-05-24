//
//  NSDecimalNumber+RoundingExtensions.h
//  Property Manager
//
//  Created by Samuel Williams on 19/02/12.
//  Copyright (c) 2012 Orion Transfer Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDecimalNumber (RoundingExtensions)

- (NSDecimalNumber *) decimalNumberByFlooring;
- (NSDecimalNumber *) decimalNumberByCeiling;

// Only works correctly for positive numbers:
- (NSDecimalNumber *) fractionalPart;

+ (NSDecimalNumber *) decimalNumberWithUnsignedInteger:(NSUInteger)integer;
+ (NSDecimalNumber *) decimalNumberWithNumerator:(NSUInteger)numerator denominator:(NSUInteger)denominator;

- (NSDecimalNumber *) decimalNumberByNegating;

@end
