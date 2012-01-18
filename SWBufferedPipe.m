//
//  SWBufferedPipe.m
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 29/03/08.
//  Copyright 2008 Samuel Williams. All rights reserved.
//

#import "SWBufferedPipe.h"

@interface SWBufferedPipe(Private)
- (void) _setupPipe: (NSPipe *) pipe;
- (void) _dataAvailable: (NSNotification *)note;
- (void) _dataFinished: (NSNotification*)note;
@end

@implementation SWBufferedPipe

@synthesize pipe, data, delegate;

- (id) init
{
	self = [super init];
    
	if (self != nil) {
		[self _setupPipe:[NSPipe pipe]];
	}
    
	return self;
}

- (id) initWithPipe: (NSPipe *)newPipe;
{
	self = [super init];
    
	if (self != nil) {
		[self _setupPipe:newPipe];
	}
	
    return self;
}

- (void) dealloc
{	
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	
	[data release];
	data = nil;
	
	[pipe release];
	pipe = nil;
	
	[super dealloc];
}

- (void) _setupPipe: (NSPipe *)newPipe
{
	data = [[NSMutableData alloc] init];
	pipe = [newPipe retain];
	handle = [pipe fileHandleForReading];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_dataAvailable:) name:NSFileHandleReadCompletionNotification object:handle];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_dataFinished:) name:NSFileHandleReadToEndOfFileCompletionNotification object:handle];
}

- (void) readInBackgroundAndNotify
{
    [handle readInBackgroundAndNotify];
}

- (void) readToEndOfFileInBackgroundAndNotify
{
    [handle readToEndOfFileInBackgroundAndNotify];
}

- (void) _dataAvailable: (NSNotification *)note
{
	NSData * readData = [[note userInfo] objectForKey:NSFileHandleNotificationDataItem];
	
	if ([readData length] > 0) {	
		[data appendData:readData];
		
		if (delegate && [delegate respondsToSelector:@selector(bufferedPipe:dataAvailable:)]) {
			[delegate bufferedPipe:self dataAvailable:readData];
		}
		
		[[pipe fileHandleForReading] readInBackgroundAndNotify];
	}
}

- (void) _dataFinished: (NSNotification*)note
{
	NSData * readData = [[note userInfo] objectForKey:NSFileHandleNotificationDataItem];
	
	if ([readData length] > 0) {	
		[data appendData:readData];
		
		if (delegate && [delegate respondsToSelector:@selector(bufferedPipe:dataFinished:)]) {
			[delegate bufferedPipe:self dataFinished:data];
		}		
	}
}

@end
