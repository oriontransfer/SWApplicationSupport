//
//  NSAlert+CompletionHandler.h
//  Property Manager
//
//  Created by Samuel Williams on 20/04/13.
//  Copyright (c) 2013 Orion Transfer Ltd. All rights reserved.
//

#import <AppKit/NSAlert.h>

typedef void (^NSAlertSheetCompletionHandler)(NSAlert *alert, NSInteger returnCode);

@interface NSAlert (CompletionHandler)
- (void)beginSheetModalForWindow:(NSWindow *)window completionHandler:(NSAlertSheetCompletionHandler)completionHandler;
@end
