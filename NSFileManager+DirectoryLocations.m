//
//  NSFileManager+DirectoryLocations.m
//  Property Manager
//
//  Created by Samuel Williams on 24/05/12.
//  Copyright (c) 2012 Orion Transfer Ltd. All rights reserved.
//

#import "NSFileManager+DirectoryLocations.h"

@implementation NSFileManager (DirectoryLocations)

- (NSArray *)listDirectories:(NSSearchPathDirectory)searchPathDirectory inDomain:(NSSearchPathDomainMask)domainMask subdirectory:(NSString *)subdirectory {
	// Search for the path
	NSArray * paths = NSSearchPathForDirectoriesInDomains(searchPathDirectory, domainMask, YES);
	
	if (subdirectory == nil) {
		return paths;
	}
	
	NSMutableArray * result = [NSMutableArray arrayWithCapacity:paths.count];
	for (NSString * path in paths) {
		[result addObject:[path stringByAppendingPathComponent:subdirectory]];
	}
	
	return result;
}

- (NSArray *)findExistingDirectories:(NSSearchPathDirectory)searchPathDirectory inDomain:(NSSearchPathDomainMask)domainMask subdirectory:(NSString *)subdirectory {
	NSArray * paths = [self listDirectories:searchPathDirectory inDomain:domainMask subdirectory:subdirectory];
	
	NSMutableArray * result = [NSMutableArray arrayWithCapacity:paths.count];
	for (NSString * path in paths) {
		if ([self fileExistsAtPath:path]) {
			[result addObject:path];
		}
	}
	
	return result;
}

- (NSString *)findOrCreateDirectory:(NSSearchPathDirectory)searchPathDirectory inDomain:(NSSearchPathDomainMask)domainMask subdirectory:(NSString *)subdirectory error:(NSError **)error
{
	NSArray * paths = [self listDirectories:searchPathDirectory inDomain:domainMask subdirectory:subdirectory];

	if (paths.count == 0) {
		return nil;
	}
	
	// Normally only need the first path
	NSString * resolvedPath = paths[0];
		
	BOOL success = [self createDirectoryAtPath:resolvedPath withIntermediateDirectories:YES attributes:nil error:error];

	if (success) {
		return resolvedPath;
	} else {
		return nil;
	}
}

- (NSString *)applicationSupportDirectory {
	NSString *executableName = [NSBundle mainBundle].infoDictionary[@"CFBundleExecutable"];

	NSError *error = nil;
	NSString *result = [self findOrCreateDirectory:NSApplicationSupportDirectory inDomain:NSUserDomainMask subdirectory:executableName error:&error];

	if (error) {
		NSLog(@"Unable to find or create application support directory: %@", error);
	}
	
	return result;
}

- (NSArray *)findExistingPaths:(NSArray*)paths withSubdirectory:(NSString*)subdirectory {
	NSMutableArray * subpaths = [NSMutableArray array];
	
	for (NSString * path in paths) {
		NSString *fullPath = [path stringByAppendingPathComponent:subdirectory];
		
		if ([self fileExistsAtPath:fullPath]) {
			[subpaths addObject:fullPath];
		}
	}
	
	return subpaths;
}

- (NSArray *)listAllSubdirectories:(NSArray*)paths {
	NSMutableArray * subdirectories = [NSMutableArray array];
	
	NSError * error = nil;
	for (NSString * path in paths) {
		NSArray * names = [self contentsOfDirectoryAtPath:path error:&error];
		
		if (error) {
			NSLog(@"Error while listing subdirectories in path %@: %@", path, error);
			
			error = nil;
			
			continue;
		}
		
		for (NSString * name in names) {
			NSString * fullPath = [path stringByAppendingPathComponent:name];
			
			BOOL directory = NO;
			[self fileExistsAtPath:fullPath isDirectory:&directory];
			
			if (directory) {
				[subdirectories addObject:fullPath];
			}
		}
	}
	
	return subdirectories;
}

@end
