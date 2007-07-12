//
//  SWControlNumberValue.h
//  Property Manager
//
//  Created by Sammi Williams on 21/07/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
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