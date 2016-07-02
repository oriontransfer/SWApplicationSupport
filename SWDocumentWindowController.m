//
//  SWDocumentWindowController.m
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 21/06/06.
//  Copyright 2006 Samuel Williams. All rights reserved.
//

#import "SWDocumentWindowController.h"


@implementation NSWindowController (SWDocumentWindowController)

- (NSManagedObjectContext*) managedObjectContext {
	NSPersistentDocument *doc = self.document;
	
	if (doc)
		return doc.managedObjectContext;
	
	return nil;
}

@end
