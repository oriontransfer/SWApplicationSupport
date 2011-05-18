//
//  NSBezierPath+SWRoundedShape.h
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 15/01/11.
//  Copyright 2011 Samuel Williams. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NSBezierPath (SWRoundedShape)

+ (NSBezierPath*) roundedBezierPathWithPoints:(NSArray*)points radius:(CGFloat)radius;

@end
