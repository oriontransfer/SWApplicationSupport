//
//  SWPathReference.m
//  Sync Manager
//
//  Created by Sammi Williams on 19/02/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import "SWPathReference.h"


@implementation SWPathReference

- initWithPath: (NSString*)newPath {
	if (self = [super init]) {
		if ([SWPathReference getFSRefAtPath:newPath ref:&self->ref] != noErr) {
			[self release];
			return nil;
		}
		
		self->path = [newPath copy];
	}
	
	return self;
}

- (void) dealloc {
	[path release];
	
	[super dealloc];
}


- (NSString*) initialPath {
	return self->path;
}

- (NSString*) path {
	NSMutableData *buf = [NSMutableData dataWithLength:512];
	
	FSRefMakePath(&self->ref, [buf mutableBytes], [buf length]);
		
	return [[[NSString alloc] initWithCString:[buf bytes] encoding:NSUTF8StringEncoding] autorelease];
}

+ (OSErr)getFSRefAtPath:(NSString*)sourceItem ref:(FSRef*)sourceRef {
    OSErr err;
    BOOL isSymLink;
    id manager = [NSFileManager defaultManager];
    NSDictionary *sourceAttribute = [manager fileAttributesAtPath:sourceItem traverseLink:NO];
	
    isSymLink = ([sourceAttribute objectForKey:@"NSFileType"] == NSFileTypeSymbolicLink);
    if(isSymLink && NO){
        const char *sourceParentPath;
        FSRef sourceParentRef;
        HFSUniStr255 sourceFileName;
        
        sourceParentPath = (UInt8*)[[sourceItem stringByDeletingLastPathComponent] fileSystemRepresentation];
        err = FSPathMakeRef(sourceParentPath, &sourceParentRef, NULL);
        if(err == noErr){
            [[sourceItem lastPathComponent] getCharacters:sourceFileName.unicode];
            sourceFileName.length = [[sourceItem lastPathComponent] length];
            if (sourceFileName.length == 0){
                err = fnfErr;
            }
            else 
				err = FSMakeFSRefUnicode(&sourceParentRef, sourceFileName.length, sourceFileName.unicode, kTextEncodingFullName, sourceRef);
        }
    }
    else{
        err = FSPathMakeRef([sourceItem fileSystemRepresentation], sourceRef, NULL);
    }
    
    return err;
}

- (NSString*) description {
	return [NSString stringWithFormat: @"<SWPathReference: %@>", [self path]];
}

@end
