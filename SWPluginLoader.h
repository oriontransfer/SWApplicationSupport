//
//  SWPlugin.h
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 3/08/06.
//  Copyright 2006 Samuel Williams. All rights reserved.
//

#import <Cocoa/Cocoa.h>

/* Can be used to load plugin bundles while providing feedback to the delegate*/
@interface SWPluginLoader : NSObject {
	id delegate;
	
	NSSet *applicationPluginSearchPaths;
	NSSet *pluginPaths;
	NSSet *loadedPlugins;
	
	NSString *bundleType;
	NSString *applicationName;
}

- (instancetype) initWithBundleType: (NSString*)newBundleType applicationName: (NSString*)appName NS_DESIGNATED_INITIALIZER;

@property (nonatomic, unsafe_unretained) id delegate;

@property (nonatomic, readonly, copy) NSSet *applicationPluginSearchPaths;
@property (nonatomic, readonly, copy) NSSet *pluginPaths;
@property (nonatomic, readonly, copy) NSSet *loadAllPlugins;

- (void) invalidateAllPlugins;

@end

@interface NSObject (SWPluginLoaderDelegate)

- (void) pluginLoader: (SWPluginLoader*)pluginLoader willScan: (NSString*)path progress: (NSRange)progress;
- (void) pluginLoader: (SWPluginLoader*)pluginLoader didScan: (NSString*)path progress: (NSRange)progress;

- (void) pluginLoader: (SWPluginLoader*)pluginLoader willLoad: (NSString*)path progress: (NSRange)progress;
- (void) pluginLoader: (SWPluginLoader*)pluginLoader didLoad: (NSString*)path result: (NSBundle*)bundle progress: (NSRange)progress;

@end
