//
//  SWControlNumberValue.h
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 21/07/06.
//  Copyright 2006 Samuel Williams. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NSControl (SWControlNumberValue)

- (NSNumber*)numberValue;
- (NSDecimalNumber*)decimalNumberValue;

- (void) setNumberValue: (NSNumber*)number;

@end

@interface NSButton (SWControlBoolValue)

- (BOOL) boolValue;
- (NSNumber*) boolNumberValue;

@end