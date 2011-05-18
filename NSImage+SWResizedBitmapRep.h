//
//  NSImage+SWResizedBitmapRep.h
//  Gocoa
//
//  Created by Samuel Williams on 9/01/11.
//  Copyright 2011 Samuel Williams. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSImage (SWResizedBitmapRep)

- (NSBitmapImageRep*) cacheBitmapRepresentation:(NSSize)size;

@end
