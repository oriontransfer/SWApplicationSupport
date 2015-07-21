//
//  SWDateFormatter.h
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 14/12/09.
//  Copyright 2009 Samuel Williams. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface SWDateFormatter : NSDateFormatter {
	NSString * nilSymbol;
}

@property (strong) NSString * nilSymbol;

@end
