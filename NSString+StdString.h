//
//  NSString+StdString.h
//  Model Builder
//
//  Created by Sammi Williams on 23/03/06.
//  Copyright 2006 Sammi Williams. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#include <string>

@interface NSString (StdString)

- (std::string) stdString;
+ (NSString*) stringWithStdString: (std::string)s;

@end
