//
//  NSString+StdString.m
//  Model Builder
//
//  Created by Sammi Williams on 23/03/06.
//  Copyright 2006 Sammi Williams. All rights reserved.
//

#import "NSString+StdString.h"


@implementation NSString (StdString)

- (std::string) stdString {
	return std::string ([self UTF8String], [self lengthOfBytesUsingEncoding:NSUTF8StringEncoding]);
}

+ (NSString*) stringWithStdString: (std::string)s {
	return [NSString stringWithUTF8String:s.c_str()];
}

@end
