//
//  NSMenuItem+SWShowHideAdditions.h
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 24/06/06.
//  Copyright 2006 Samuel Williams. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSMenu (SWShowHideAdditions)

- (void) updateTaggedItem: (int)tag withTitle:(NSString*)postfix isHidden: (BOOL)hidden;

@end

@interface NSMenuItem (SWShowHideAdditions)

- (void) updateTitle:(NSString*)postfix isHidden: (BOOL)hidden;

@end
