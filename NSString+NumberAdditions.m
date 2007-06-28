//
//  NSString+NumberAdditions.m
//  SWNetworking
//
//  Created by Sammi Williams on 7/01/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import "NSString+NumberAdditions.h"


@implementation NSString (NumberAdditions)

- (BOOL) isUnsignedInteger {
	NSRange numberRange = [self rangeOfCharacterFromSet:[NSCharacterSet characterSetWithCharactersInString:@"0123456789"]];
	
	if (numberRange.location == NSNotFound)
		return NO;
	
	return YES;
}

- (int) intValue {
	return atoi([self UTF8String]);
}

- (long int) longIntValue {
	return atol([self UTF8String]);
}

- (double) floatValue {
	return atof([self UTF8String]);
}

@end
