//
//  ABRecord+SWStandardFieldsAddition.h
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 24/06/06.
//  Copyright 2006 Samuel Williams. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AddressBook/AddressBook.h>


@interface ABRecord (SWStandardFieldsAddition)

- (NSString*) standardName;
- (NSImage*) standardImage;

@end
