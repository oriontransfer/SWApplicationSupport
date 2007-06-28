//
//  NSString (SWStringEscapingAdditions).h
//  Property Manager
//
//  Created by Sammi Williams on 13/11/05.
//  Copyright 2005 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NSString (SWStringEscapingAdditions)

- (NSString*)quote;
- (NSString*)unquote;

- (NSString*)substitute: (NSDictionary*)replacements;

- (NSString*)stripSurroundingSpaces;

- (NSString*)escape;
- (NSString*)escapeCharactersInSet: (NSCharacterSet*)escapableSet;
- (NSString*)unEscape;

- (NSString*)formatWith:(NSDictionary*)substitutes;

@end
