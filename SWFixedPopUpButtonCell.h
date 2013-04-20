//
//  SWFixedPopUpButtonCell.h
//  Property Manager
//
//  Created by Samuel Williams on 20/04/13.
//  Copyright (c) 2013 Orion Transfer Ltd. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SWFixedPopUpButtonCell : NSPopUpButtonCell

// Set a fixed title for the NSPopUpButtonCell, for example "Open Recent".
- (void)setFixedTitle:(NSString *)fixedTitle;

@end
