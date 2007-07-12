//
//  SWDocumentWindowController.m
//  Property Manager
//
//  Created by Sammi Williams on 21/06/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import "SWDocumentWindowController.h"


@implementation NSWindowController (SWDocumentWindowController)

- (NSManagedObjectContext*) managedObjectContext {
	NSPersistentDocument *doc = [self document];
	
	if (doc)
		return [doc managedObjectContext];
	
	return nil;
}

@end
