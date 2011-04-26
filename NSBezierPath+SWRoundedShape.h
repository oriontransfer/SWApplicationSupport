//
//  NSBezierPath+SWRoundedShape.h
//  Gocoa
//
//  Created by Samuel Williams on 15/01/11.
//  Copyright 2011 Orion Transfer Ltd. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NSBezierPath (SWRoundedShape)

+ (NSBezierPath*) roundedBezierPathWithPoints:(NSArray*)points radius:(CGFloat)radius;

@end
