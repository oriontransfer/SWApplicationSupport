//
//  SWControlNumberValue.h
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 21/07/06.
//  Copyright 2006 Samuel Williams. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NSControl (SWControlNumberValue)

@property (nonatomic, copy) NSNumber *numberValue;
@property (nonatomic, readonly, copy) NSDecimalNumber *decimalNumberValue;


@end

@interface NSButton (SWControlBoolValue)

@property (nonatomic, readonly) BOOL boolValue;
@property (nonatomic, readonly, copy) NSNumber *boolNumberValue;

@end