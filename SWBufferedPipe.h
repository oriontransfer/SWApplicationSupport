//
//  SWBufferedPipe.h
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 29/03/08.
//  Copyright 2008 Samuel Williams. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SWBufferedPipe : NSObject {
	NSPipe * pipe;
	NSMutableData * data;
	
	id delegate;
}

- initWithPipe: (NSPipe *) pipe;
- init;

@property(readonly,retain) NSPipe * pipe;
@property(readonly,retain) NSMutableData * data;

@property(assign) id delegate;

@end

@interface NSObject (SWBufferedPipeDelegate)
- (void) bufferedPipe: (SWBufferedPipe*)buf hasNewDataAvailable: (NSData*)data;
@end
