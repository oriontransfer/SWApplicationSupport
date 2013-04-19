//
//  NSAlert+CompletionHandler.m
//  Property Manager
//
//  Created by Samuel Williams on 20/04/13.
//  Copyright (c) 2013 Orion Transfer Ltd. All rights reserved.
//

#import "NSAlert+CompletionHandler.h"

@interface _NSAlertSheetCompletionHandlerRunner : NSObject
@property(nonatomic,retain) NSAlert * alert;
@property(nonatomic,copy) NSAlertSheetCompletionHandler completionHandler;

- initWithAlert:(NSAlert *)alert completionHandler:(NSAlertSheetCompletionHandler)completionHandler;
@end

@implementation _NSAlertSheetCompletionHandlerRunner

- initWithAlert:(NSAlert *)alert completionHandler:(NSAlertSheetCompletionHandler)completionHandler
{
	self = [super init];

	if (self) {
		self.alert = alert;
		self.completionHandler = completionHandler;
	}

	return self;
}

- (void)dealloc
{
	self.alert = nil;
	self.completionHandler = nil;

	[super dealloc];
}

- (void)startOnWindow:(NSWindow *)parentWindow
{
	[self retain];

	[self.alert beginSheetModalForWindow:parentWindow modalDelegate:self didEndSelector:@selector(alertDidEnd:returnCode:contextInfo:) contextInfo:NULL];
}

- (void)alertDidEnd:(NSAlert *)alert returnCode:(NSInteger)returnCode contextInfo:(void *)contextInfo
{
    NSAssert(alert == _alert, @"Invalid alert in callback!");
    
	[self autorelease];
    
    if (_completionHandler)
        _completionHandler(_alert, returnCode);
}

@end

@implementation NSAlert (CompletionHandler)

- (void)beginSheetModalForWindow:(NSWindow *)window completionHandler:(NSAlertSheetCompletionHandler)completionHandler;
{
	_NSAlertSheetCompletionHandlerRunner * alertRunner = [[_NSAlertSheetCompletionHandlerRunner alloc] initWithAlert:self completionHandler:completionHandler];

	[alertRunner startOnWindow:window];
}

@end
