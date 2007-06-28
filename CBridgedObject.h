//
//  CBridgedObject.h
//  Model Builder
//
//  Created by Sammi Williams on 28/04/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#include <map>
#include <vector>

class BridgedObjectInterface {
public:
	virtual ~BridgedObjectInterface ();
};

template <typename object_t>
NSMutableSet *setFromVector(Class bridgeClass, std::vector<object_t> vec);

@interface CBridgedObject : NSObject {
	BridgedObjectInterface *__object;
}

/* This is the main constructor. Bridge classes 
should do no initialization by default. */
+ bridgedObject: (BridgedObjectInterface*)object;

/* To use a bridge class to create a new object,
override the init method as so 
	
	- init {
		if (self = [super initWithObject:new MyClass]) {
			//don't do any MyClass initialization here - do it in
			//the constructor for MyClass, unless it is Cocoa specific
		}
	
		return self;
	}

THE DEFAULT INIT METHOD WILL FAIL SYSTEMATICALLY
	TO PREVENT ERRORS. NEVER USE IT!

*/

- initWithObject: (BridgedObjectInterface*)object;
- init;

/* This function access the internal object */
- (BridgedObjectInterface*) object;

@end
