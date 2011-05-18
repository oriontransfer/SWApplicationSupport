//
//  SWIsNilDate.h
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 19/10/05.
//  Copyright 2005 Samuel Williams. All rights reserved.
//

#import <Cocoa/Cocoa.h>

/*
	This Value Transformer is used in the Tenure Inspector user interface so that
	a checkbox will return todays date when checked, or nil when not.
 */

@interface SWIsNilDate : NSValueTransformer {
}

@end

@interface SWBlankStringIsNil : NSValueTransformer {
}

@end
