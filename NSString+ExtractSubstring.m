//
//  NSString+ExtractSubstring.m
//  Router Throughput
//
//  Created by Sammi Williams on 11/01/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import "NSString+ExtractSubstring.h"


@implementation NSString (ExtractSubstring)

- (NSString*) extractStringBetween: (NSString*)a and: (NSString*)b {
	NSRange range = [self rangeOfString:a];
	int start = range.location + range.length;
	
	if (range.location == NSNotFound) {
		NSLog (@"%s: start string not found", __FUNCTION__);
		return nil;
	}
	
	range.location = start;
	range.length = [self length] - start;
	
	range = [self rangeOfString:b options:0 range:range];
	
	if (range.location == NSNotFound) {
		NSLog (@"%s: end string not found", __FUNCTION__);
		return nil;
	}	
	
	int end = range.location;
	
	return [self substringWithRange:NSMakeRange(start, end - start)];
}

@end
