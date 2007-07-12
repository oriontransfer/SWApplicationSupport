//
//  ABRecord+SWStandardFieldsAddition.h
//  Property Manager
//
//  Created by Sammi Williams on 24/06/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AddressBook/AddressBook.h>


@interface ABRecord (SWStandardFieldsAddition)

- (NSString*) standardName;
- (NSImage*) standardImage;

@end
