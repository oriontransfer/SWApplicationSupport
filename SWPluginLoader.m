//
//  SWPlugin.m
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 3/08/06.
//  Copyright 2006 Samuel Williams. All rights reserved.
//

#import "SWPluginLoader.h"


@implementation SWPluginLoader

- (instancetype) initWithBundleType: (NSString*)newBundleType applicationName: (NSString*)appName {
	if (self = [super init]) {
		bundleType = [newBundleType copy];
		applicationName = [appName copy];
	}
	
	return self;
}

- (void) setDelegate: (id)newDelegate {
	delegate = newDelegate;
}

- (id) delegate {
	return delegate;
}

/* This will find all the paths where possible plugins could be located */
- (NSSet*) applicationPluginSearchPaths {
	if (!applicationPluginSearchPaths) {
		//NSBundle * appBundle = [NSBundle mainBundle];
		
		NSString *appSupportSubpath = [NSString stringWithFormat:@"/Application Support/%@/PlugIns", applicationName];
		NSString *builtInPath = [NSBundle mainBundle].builtInPlugInsPath;
		NSArray *librarySearchPaths;
		NSEnumerator *searchPathEnum;
		NSMutableArray *bundleSearchPaths = [NSMutableArray array];
		
		// Find Library directories in all domains except /System
		librarySearchPaths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSAllDomainsMask - NSSystemDomainMask, YES);
		
		// Copy each discovered path into an array after adding
		// the Application Support/KillerApp/PlugIns subpath
		searchPathEnum = [librarySearchPaths objectEnumerator];
		NSString *currPath;
		while(currPath = [searchPathEnum nextObject]) {
			[bundleSearchPaths addObject:[currPath stringByAppendingPathComponent:appSupportSubpath]];
		}
		
		[bundleSearchPaths addObject:builtInPath];		
		
		applicationPluginSearchPaths = [NSSet setWithArray:bundleSearchPaths];
	}
	
	return applicationPluginSearchPaths;
}

/* This will find paths to all plugins available */
- (NSSet*) pluginPaths {
	if (!pluginPaths) {
		NSSet *paths = self.applicationPluginSearchPaths;
		NSMutableArray *bundlePaths = [NSMutableArray new];
		
		NSRange progress = NSMakeRange(0, paths.count);
		
		NSEnumerator *searchPathEnum = [paths objectEnumerator];
		NSString *currPath;
		while (currPath = [searchPathEnum nextObject]) {
			if (delegate && [delegate respondsToSelector:@selector(pluginLoader:willScan:progress:)]) 
				[delegate pluginLoader:self willScan:currPath progress:progress];
			
			[bundlePaths addObjectsFromArray:[NSBundle pathsForResourcesOfType:bundleType inDirectory:currPath]];
			progress.location += 1;
			
			if (delegate && [delegate respondsToSelector:@selector(pluginLoader:didScan:progress:)]) 
				[delegate pluginLoader:self didScan:currPath progress:progress];		
		}
		
		pluginPaths = [NSSet setWithArray:bundlePaths];
	}
	
	return pluginPaths;
}

/* Load all plugins */
- (NSSet*) loadAllPlugins {
	if (!loadedPlugins) {
		NSSet *bundlePaths = self.pluginPaths;
		NSMutableArray *allBundles = [NSMutableArray new];
		
		NSRange progress = NSMakeRange(0, bundlePaths.count);
		
		NSEnumerator *bundlePathEnum = [bundlePaths objectEnumerator];
		NSString *currPath;
		while (currPath = [bundlePathEnum nextObject]) {
			if (delegate && [delegate respondsToSelector:@selector(pluginLoader:willLoad:progress:)]) 
				[delegate pluginLoader:self willLoad:currPath progress:progress];
			
			NSBundle *bundle = [NSBundle bundleWithPath:currPath];
			
			if (bundle == nil) {
				NSLog (@"Error loading bundle: %@", currPath);
				continue;
			}
			
			[allBundles addObject:bundle];
			progress.location += 1;
			
			if (delegate && [delegate respondsToSelector:@selector(pluginLoader:didLoad:result:progress:)]) 
				[delegate pluginLoader:self didLoad:currPath result:bundle progress:progress];
		}
		
		loadedPlugins = [NSSet setWithArray:allBundles];
	}
	
	return loadedPlugins;
}

- (void) invalidateAllPlugins {
	applicationPluginSearchPaths = nil;
	
	pluginPaths = nil;
	
	loadedPlugins = nil;
}



- (void) dealloc {
	[self invalidateAllPlugins];
	
	bundleType = nil;
	
	applicationName = nil;
	
}


@end
