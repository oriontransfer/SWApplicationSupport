//
//  NSMenuItem+SWShowHideAdditions.h
//  Property Manager
//
//  Created by Sammi Williams on 24/06/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSMenu (SWShowHideAdditions)

- (void) updateTaggedItem: (int)tag withTitle:(NSString*)postfix isHidden: (BOOL)hidden;

@end

@interface NSMenuItem (SWShowHideAdditions)

- (void) updateTitle:(NSString*)postfix isHidden: (BOOL)hidden;

@end
