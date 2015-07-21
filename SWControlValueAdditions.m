//
//  SWControlNumberValue.m
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 21/07/06.
//  Copyright 2006 Samuel Williams. All rights reserved.
//

#import "SWControlValueAdditions.h"


@implementation NSControl (SWControlNumberValue)

- (NSNumber*)numberValue {
	if ([self formatter])
		return [[self formatter] numberFromString:[self stringValue]];
	else
		return nil;
}

- (NSDecimalNumber*)decimalNumberValue {
	if ([self formatter])
		return [NSDecimalNumber decimalNumberWithDecimal:[[self numberValue] decimalValue]];
	else
		return [NSDecimalNumber decimalNumberWithString:[self stringValue]];
}

- (void) setNumberValue: (NSNumber*)number {
	if ([self formatter])
		[self setStringValue:[[self formatter] stringFromNumber:number]];
	else// if ([number isKindOfClass:[NSDecimalNumber class]])
		[self setStringValue:[(NSDecimalNumber*)number description]];
}

@end

@implementation NSButton (SWControlBoolValue)

- (BOOL) boolValue {
	if ([self state] == NSOnState)
		return YES;
	else
		return NO;
}

- (NSNumber*) boolNumberValue {
	return @([self boolValue]);
}

@end