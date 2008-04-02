//
//  NSData+CopyToBuffer.h
//  SWCryptography
//
//  Created by Sammi Williams on 20/02/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NSData (CopyToBuffer)

- (void) copyToBuffer: (char*)buffer maxLength: (size_t)length;

@end

@interface NSMutableData (PopLine)

// Reads a whole line off the front of the data, and removes any data transformed into a line.
- (NSString*) popLine;

@end