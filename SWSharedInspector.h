//
//  SWSharedInspector.h
//  Model Builder
//
//  Created by Sammi Williams on 21/03/06.
//  Copyright 2006 Sammi Williams. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface SWSharedInspector : NSWindowController {
	id document;
}

+ (id) sharedInspector;
- (id) document;
- (void) setDocument: (id) document;

@end
