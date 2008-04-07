//
//  SWPlugin.h
//  Property Manager
//
//  Created by Sammi Williams on 3/08/06.
//  Copyright 2006 Samuel Williams, Orion Transfer Ltd. All rights reserved.
//
//  This software was originally produced by Orion Transfer Ltd.
//    Please see http://www.oriontransfer.org for more details.
//

/*
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

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

- initWithBundleType: (NSString*)newBundleType applicationName: (NSString*)appName;

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
