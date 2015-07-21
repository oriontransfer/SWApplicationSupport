//
//  NSDecimalNumber+RoundingExtensions.m
//  Property Manager
//
//  Created by Samuel Williams on 19/02/12.
//  Copyright (c) 2012 Orion Transfer Ltd. All rights reserved.
//

#import "NSDecimalNumber+RoundingExtensions.h"

@implementation NSDecimalNumber (RoundingExtensions)

- (NSDecimalNumber *)decimalNumberByFlooring {
	static NSDecimalNumberHandler * behavior = nil;
	
	if (!behavior) {
		behavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:0 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
	}
	
	return [self decimalNumberByRoundingAccordingToBehavior:behavior];
}

- (NSDecimalNumber *)decimalNumberByCeiling {
	static NSDecimalNumberHandler * behavior = nil;
	
	if (!behavior) {
		behavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundUp scale:0 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
	}
	
	return [self decimalNumberByRoundingAccordingToBehavior:behavior];
}

- (NSDecimalNumber *)fractionalPart {
	return [self decimalNumberBySubtracting:[self decimalNumberByFlooring]];
}

+ (NSDecimalNumber *) decimalNumberWithUnsignedInteger:(NSUInteger)integer {
	return [[self.class alloc] initWithUnsignedInteger:integer];
}

+ (NSDecimalNumber *) decimalNumberWithNumerator:(NSUInteger)numerator denominator:(NSUInteger)denominator {
	return [[self decimalNumberWithUnsignedInteger:numerator] decimalNumberByDividingBy:[self decimalNumberWithUnsignedInteger:denominator]];
}

- (NSDecimalNumber *) decimalNumberByNegating {
	return [self decimalNumberByMultiplyingBy:[NSDecimalNumber decimalNumberWithMantissa:1 exponent:0 isNegative:YES]];
}

@end
