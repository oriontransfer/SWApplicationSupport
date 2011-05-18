//
//  SWDateFormatter.m
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 14/12/09.
//  Copyright 2009 Samuel Williams. All rights reserved.
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

- (void) dealloc {
	[nilSymbol release];
}

@end
