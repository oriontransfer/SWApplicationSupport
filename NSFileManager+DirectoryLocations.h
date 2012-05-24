//
//  NSFileManager+DirectoryLocations.h
//  Property Manager
//
//  Created by Samuel Williams on 24/05/12.
//  Copyright (c) 2012 Orion Transfer Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (DirectoryLocations)

- (NSString *)findOrCreateDirectory:(NSSearchPathDirectory)searchPathDirectory inDomain:(NSSearchPathDomainMask)domainMask subdirectory:(NSString *)subdirectory error:(NSError **)error;

- (NSString *)applicationSupportDirectory;

- (NSArray *)listDirectories:(NSSearchPathDirectory)searchPathDirectory inDomain:(NSSearchPathDomainMask)domainMask subdirectory:(NSString *)subdirectory;

- (NSArray *)findExistingDirectories:(NSSearchPathDirectory)searchPathDirectory inDomain:(NSSearchPathDomainMask)domainMask subdirectory:(NSString *)subdirectory;

- (NSArray *)findExistingPaths:(NSArray*)paths withSubdirectory:(NSString*)subdirectory;
- (NSArray *)listAllSubdirectories:(NSArray*)inPaths;

@end
