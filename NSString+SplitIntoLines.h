//
//  NSString (SWSplitIntoLinesAddition).h
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 20/10/05.
//  Copyright 2005 Samuel Williams. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSString (SWSplitIntoLinesAddition) 

- (NSMutableArray*) componentsSeparatedByCharactersInSet:(NSCharacterSet *)charSet;
- (NSArray*) componentsSeparatedByLineBreaks;

@end
