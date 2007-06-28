//
//  SWImageAdditions.h
//  Property Manager
//
//  Created by Sammi Williams on 24/06/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NSImage (SWImageAdditions)

- (NSImage*) resizeImage: (NSSize)newSize;

- (NSSize) pixelSize;
- (float) pixelWidth;
- (float) pixelHeight;

@end
