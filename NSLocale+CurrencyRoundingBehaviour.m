//
//  NSLocale+CurrencyRoundingBehaviour.m
//  Property Manager
//
//  Created by Samuel Williams on 8/04/12.
//  Copyright (c) 2012 Orion Transfer Ltd. All rights reserved.
//

#import "NSLocale+CurrencyRoundingBehaviour.h"

@implementation NSLocale (CurrencyRoundingBehaviour)

+ (id<NSDecimalNumberBehaviors>)currencyRoundingBehaviourForCurrencyCode:(NSString *)currencyCode
{
	int32_t defaultFractionDigits;
	double roundingIncrement;
	
	CFNumberFormatterGetDecimalInfoForCurrencyCode((CFStringRef)currencyCode, &defaultFractionDigits, &roundingIncrement);

	return [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundBankers scale:defaultFractionDigits raiseOnExactness:NO raiseOnOverflow:YES raiseOnUnderflow:YES raiseOnDivideByZero:YES];
}

- (id<NSDecimalNumberBehaviors>)currencyRoundingBehaviour {
	NSString * currencyCode = [self objectForKey:NSLocaleCurrencyCode];

	return [[self class] currencyRoundingBehaviourForCurrencyCode:currencyCode];
}

@end
