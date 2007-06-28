//
//  NSString+NumberAdditions.h
//  SWNetworking
//
//  Created by Sammi Williams on 7/01/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NSString (NumberAdditions)

- (BOOL) isUnsignedInteger;

- (int) intValue;
- (long int) longIntValue;
- (double) floatValue;

@end
