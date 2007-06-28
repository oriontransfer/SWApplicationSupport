//
//  NSData+CopyToBuffer.m
//  SWCryptography
//
//  Created by Sammi Williams on 20/02/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import "NSData+CopyToBuffer.h"


@implementation NSData (CopyToBuffer)

- (void) copyToBuffer: (char*)buffer maxLength: (size_t)length {
	memcpy(buffer, [self bytes], MIN(length, [self length]));
}

@end
