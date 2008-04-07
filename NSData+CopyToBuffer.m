//
//  NSData+CopyToBuffer.m
//  SWCryptography
//
//  Created by Sammi Williams on 20/02/06.
//  Copyright 2006 Samuel Williams, Orion Transfer Ltd. All rights reserved.
//

#import "NSData+CopyToBuffer.h"

#include <string.h>

@interface NSData (PopLinePrivate)
- (NSUInteger) findLineEnding;
@end

@implementation NSData (CopyToBuffer)

- (void) copyToBuffer: (char*)buffer maxLength: (size_t)length {
	memcpy(buffer, [self bytes], MIN(length, [self length]));
}

- (NSUInteger) findLineEnding {
	const char * buf = [self bytes];
	NSUInteger i = 0, sz = [self length];
	
	while (i < sz && buf[i] != '\r' && buf[i] != '\n') {
		i++;
	}
	
	return i;
}

@end


@implementation NSMutableData (PopLine)

- (NSString*) popLine {
	NSUInteger offset = [self findLineEnding];
	if (offset >= [self length]) return nil;
	
	NSRange lineRange = NSMakeRange(0, offset);
	NSData * lineData = [self subdataWithRange:lineRange];
	
	const char * buf = [self bytes];
	
	while ((buf[offset] == '\r' || buf[offset] == '\n') && offset < [self length]) {
		offset += 1;
	}
	
	[self replaceBytesInRange:NSMakeRange(0, offset) withBytes:NULL length:0];
	
	NSString * line = [[NSString alloc] initWithData:lineData encoding:NSUTF8StringEncoding];
	
	//NSLog (@"Popping line: %@", line);
	
	return [line autorelease];
}

@end
