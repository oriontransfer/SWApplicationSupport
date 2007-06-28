//
//  NSString (SWSplitIntoLinesAddition).m
//  Telephone Operator
//
//  Created by Sammi on 20/10/05.
//  Copyright 2005 __MyCompanyName__. All rights reserved.
//

#import "NSString+SplitIntoLines.h"


@implementation NSString (SWSplitIntoLinesAddition)

- (NSMutableArray*) componentsSeparatedByCharactersInSet:(NSCharacterSet *)charSet {
    NSMutableArray *components = [NSMutableArray arrayWithCapacity:[self length]/2];
    NSScanner *scanner = [NSScanner scannerWithString:self];
    [scanner setCharactersToBeSkipped:nil];
	
    while (![scanner isAtEnd]) {
        NSString *aString;
        if ([scanner scanUpToCharactersFromSet:charSet intoString:&aString]) {
            [components addObject:aString];
        }
		
        [scanner scanCharactersFromSet:charSet intoString:nil];
    }
    return components;
}

- (NSArray*) componentsSeparatedByLineBreaks {
	NSCharacterSet *cs = [NSCharacterSet characterSetWithCharactersInString:@"\r\n"];
	return [self componentsSeparatedByCharactersInSet:cs];
}

@end
