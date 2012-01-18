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
	NSFileHandle * handle;
	
	id delegate;
}

- initWithPipe: (NSPipe *) pipe;
- init;

@property(readonly,retain) NSPipe * pipe;
@property(readonly,retain) NSMutableData * data;

@property(assign) id delegate;

- (void) readInBackgroundAndNotify;
- (void) readToEndOfFileInBackgroundAndNotify;

@end

@interface NSObject (SWBufferedPipeDelegate)
- (void) bufferedPipe: (SWBufferedPipe*)buffer dataAvailable: (NSData*)data;
- (void) bufferedPipe: (SWBufferedPipe*)buffer dataFinished: (NSData*)data;
@end
