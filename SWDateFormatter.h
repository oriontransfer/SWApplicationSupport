//
//  SWDateFormatter.h
//  Property Manager
//
//  Created by Samuel Williams on 14/12/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface SWDateFormatter : NSDateFormatter {
	NSString * nilSymbol;
}

@property (retain) NSString * nilSymbol;

@end
