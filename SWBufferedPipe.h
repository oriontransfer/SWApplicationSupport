//
//  SWBufferedPipe.h
//  GPS Tool
//
//  Created by Samuel Williams on 29/03/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

/*
	SWBufferedPipe
	
	Usage:
		SWBufferedPipe buf = [SWBufferedPipe new];
		[task setStandardInput:[buf pipe]];
		[buf setDelegate:self];
	
	- bufferedPipe: (SWBufferedPipe*)pipe hasNewDataAvailable: (NSData*)data {
	
	}		
		
*/

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
