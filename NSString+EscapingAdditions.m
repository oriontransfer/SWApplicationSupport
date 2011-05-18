//
//  NSString (SWStringEscapingAdditions).m
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 13/11/05.
//  Copyright 2005 Samuel Williams. All rights reserved.
//

#import "NSString+EscapingAdditions.h"

@implementation NSString (SWStringEscapingAdditions)

- (NSString*)substitute: (NSDictionary*)replacements {	
	NSEnumerator * keyEnumerator = [replacements keyEnumerator];
	NSMutableString * result = [self mutableCopy];
	
	NSString * key = nil;
	while (key = [keyEnumerator nextObject]) {
		NSString * value = [replacements objectForKey:key];
		[result replaceOccurrencesOfString:key withString:value options:0 range:NSMakeRange(0, [result length])];
	}
	
	return [result autorelease];
}

//"The %name% is feeling %feeling%!"
- (NSString*)formatWith:(NSDictionary*)substitutes {
	NSString *part, *substitute;
	NSArray *parts = [self componentsSeparatedByString:@"%"];
	NSMutableString *newString = [[NSMutableString alloc] initWithString:[parts objectAtIndex:0]];
	size_t i;
	
	for (i = 1; i < [parts count]; ++i) {
		part = (NSString*)[parts objectAtIndex:i];
		substitute = [substitutes objectForKey:part];
		if (substitute != nil)
			[newString appendString:substitute];
		else
			[newString appendString:part];
	}
	
	return [newString autorelease];
}

- (NSString*) quote { 
    return [NSString stringWithFormat:@"\"%@\"", [self escapeCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\""]]]; 
}

- (NSString*) unquote {
    NSRange range;
    NSString* retString = [self description];
    
    if ([retString length] && [retString characterAtIndex:0] == '"' && [retString characterAtIndex:([retString length] -1)] == '"') {
        range.location = 1;
        range.length = [retString length] - 2;
        
        if (range.length) retString = [retString substringWithRange:range];
    }
    
    return retString;
}

- (NSString*)stripSurroundingSpaces {
    NSRange startRange = [self rangeOfCharacterFromSet:[[NSCharacterSet whitespaceAndNewlineCharacterSet] invertedSet]];
    NSRange endRange = [self rangeOfCharacterFromSet:[[NSCharacterSet whitespaceAndNewlineCharacterSet] invertedSet] options:NSBackwardsSearch];
    
    if (startRange.location == NSNotFound || endRange.location == NSNotFound) return nil;
    
    return [self substringWithRange:NSMakeRange(startRange.location, endRange.location - startRange.location + 1)];
}

- (NSString*)escapeCharactersInSet: (NSCharacterSet*)escapableSet {
    NSMutableString* workingStr = [self mutableCopy];
    unsigned index = [workingStr rangeOfCharacterFromSet:escapableSet options:NSLiteralSearch range:NSMakeRange(0, [workingStr length])].location;
    
    while (index != NSNotFound)  {
        [workingStr insertString:@"\\" atIndex:index];
        if (index >= [workingStr length] - 1) index = NSNotFound;
        else index = [workingStr rangeOfCharacterFromSet:escapableSet options:NSLiteralSearch range:NSMakeRange(index + 2, [workingStr length] - index - 2)].location;
    }
    return [NSString stringWithString:workingStr];

}

- (NSString*)escape {
	return [self escapeCharactersInSet: [NSCharacterSet characterSetWithCharactersInString:@"\"\\-+=%/<>#()*"]];
}

- (NSString*)unEscape {
    NSMutableString* workingStr = [self mutableCopy];
    unsigned index = [workingStr rangeOfString:@"\\" options:NSLiteralSearch range:NSMakeRange(0, [workingStr length])].location;
    
    while (index != NSNotFound) {
        [workingStr deleteCharactersInRange:NSMakeRange(index, 1)];
        if (index < [workingStr length]) index = [workingStr rangeOfString:@"\\" options:NSLiteralSearch range:NSMakeRange(index + 1, [workingStr length] - index - 2)].location;
        else index = NSNotFound;
    }
    return [NSString stringWithString:workingStr];
}

/*
Usless function.. use SWSplitIntoLinesAddition

- (NSArray *) componentsSeparatedByLineSeparators
{
	NSMutableArray *result	= [NSMutableArray array];
	NSRange range = NSMakeRange(0,0);
	unsigned start, end;
	unsigned contentsEnd = 0;

	while (contentsEnd < [self length])
	{
		[self getLineStart:&start end:&end contentsEnd:&contentsEnd forRange:range];
		[result addObject:[self substringWithRange:NSMakeRange(start,contentsEnd-start)]];
		range.location = end;
		range.length = 0;
	}
	return result;
}
*/
@end
