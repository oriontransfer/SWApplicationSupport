//
//  NSString (SWSplitIntoLinesAddition).h
//  Telephone Operator
//
//  Created by Sammi on 20/10/05.
//  Copyright 2005 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSString (SWSplitIntoLinesAddition) 

- (NSMutableArray*) componentsSeparatedByCharactersInSet:(NSCharacterSet *)charSet;
- (NSArray*) componentsSeparatedByLineBreaks;

@end
