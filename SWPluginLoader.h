//
//  SWPlugin.h
//  Property Manager
//
//  Created by Sammi Williams on 3/08/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

/* Can be used to load plugin bundles while providing feedback to the delegate*/
@interface SWPluginLoader : NSObject {
	id delegate;
	
	NSSet *applicationPluginSearchPaths;
	NSSet *pluginPaths;
	NSSet *loadedPlugins;
	
	NSString *bundleType;
}

- initWithBundleType: (NSString*)newBundleType;
- init;

- (void) setDelegate: (id)newDelegate;
- (id) delegate;

- (NSSet*) applicationPluginSearchPaths;
- (NSSet*) pluginPaths;
- (NSSet*) loadAllPlugins;

- (void) invalidateAllPlugins;

@end

@interface NSObject (SWPluginLoaderDelegate)

- (void) pluginLoader: (SWPluginLoader*)pluginLoader willScan: (NSString*)path progress: (NSRange)progress;
- (void) pluginLoader: (SWPluginLoader*)pluginLoader didScan: (NSString*)path progress: (NSRange)progress;

- (void) pluginLoader: (SWPluginLoader*)pluginLoader willLoad: (NSString*)path progress: (NSRange)progress;
- (void) pluginLoader: (SWPluginLoader*)pluginLoader didLoad: (NSString*)path result: (NSBundle*)bundle progress: (NSRange)progress;

@end
