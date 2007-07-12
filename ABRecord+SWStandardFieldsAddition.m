//
//  ABRecord+SWStandardFieldsAddition.m
//  Property Manager
//
//  Created by Sammi Williams on 24/06/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import "ABRecord+SWStandardFieldsAddition.h"


@implementation ABRecord (SWStandardFieldsAddition)

- (NSString*) standardName {
	NSString *orgName = [self valueForProperty:kABOrganizationProperty];
	
	if (orgName != nil)
		return orgName;
	
	NSString *firstName, *lastName;
	
	firstName = [self valueForProperty:kABFirstNameProperty];
	lastName = [self valueForProperty:kABLastNameProperty];
	
	if (firstName && lastName)
		return [NSString stringWithFormat:@"%@ %@", firstName, lastName];
	else if (firstName)
		return firstName;
	else if (lastName)
		return lastName;
	
	return nil;
}

- (NSImage*) standardImage {
	if ([self respondsToSelector:@selector(imageData)] && [self imageData])
		return [[[NSImage alloc] initWithData:[self imageData]] autorelease];
	else
		return nil;
}

@end
