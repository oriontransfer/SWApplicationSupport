//
//  NSLocale+CurrencyRoundingBehaviour.h
//  Property Manager
//
//  Created by Samuel Williams on 8/04/12.
//  Copyright (c) 2012 Orion Transfer Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSLocale (CurrencyRoundingBehaviour)

- (id<NSDecimalNumberBehaviors>) currencyRoundingBehaviour;
+ (id<NSDecimalNumberBehaviors>)currencyRoundingBehaviourForCurrencyCode:(NSString *)currencyCode;

@end
