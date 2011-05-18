//
//  NSString (SWStringEscapingAdditions).h
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 13/11/05.
//  Copyright 2005 Samuel Williams. All rights reserved.
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
