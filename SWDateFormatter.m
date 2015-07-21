//
//  SWDateFormatter.m
//  Property Manager
//
//  Created by Samuel Williams on 14/12/09.
//  Copyright 2009 Orion Transfer Ltd. All rights reserved.
//

#import "SWDateFormatter.h"


@implementation SWDateFormatter

@synthesize nilSymbol;

- (BOOL)getObjectValue:(out id *)anObject forString:(NSString *)aString range:(inout NSRange *)rangep error:(out NSError **)error
{
	BOOL result = [super getObjectValue:anObject forString:aString range:rangep error:error]; 

	if (!result && ((aString == nil) || ([aString isEqualToString:nilSymbol]))) {
		*anObject = nil;
		result = YES;
	}

	return result;
}


@end
