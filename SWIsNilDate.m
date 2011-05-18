//
//  SWIsNilDate.m
//  This file is part of the "SWApplicationSupport" project, and is distributed under the MIT License.
//
//  Created by Samuel Williams on 19/10/05.
//  Copyright 2005 Samuel Williams. All rights reserved.
//

#import "SWIsNilDate.h"


@implementation SWIsNilDate
+ (void) initialize {
	static BOOL initialized = NO;
	
	if (!initialized) {
		[NSValueTransformer setValueTransformer:[[[[self class] alloc] init] autorelease] forName:@"SWIsNilDate"];	
		initialized = YES;
	}
}

+ (Class)transformedValueClass { 
	return [NSString self];
}

+ (BOOL)allowsReverseTransformation {
	return YES;
}

- (id)transformedValue:(id)value {
	//NSLog (@"Transforming: %@", value);
	return (value == nil) ? nil : [NSNumber numberWithBool:YES];
}

- (id)reverseTransformedValue:(id)value {
	//NSLog (@"Reverse Transforming: %@", value);
	if ([(NSNumber*)value boolValue])
		return [NSDate date];
	else
		return nil;
}
@end


@implementation SWBlankStringIsNil
+ (void) initialize {
	static BOOL initialized = NO;
	
	if (!initialized) {
		[NSValueTransformer setValueTransformer:[[[[self class] alloc] init] autorelease] forName:@"SWBlankStringIsNil"];	
		initialized = YES;
	}
}

+ (Class)transformedValueClass { 
	return [NSString self];
}

+ (BOOL)allowsReverseTransformation {
	return YES;
}

- (id)transformedValue:(id)value {
	NSLog (@"Transforming: %@ (%@)", value, [value class]);

	if (value && [value isEqualTo:@""]) {
		return nil;
	}

	return value;
}

- (id)reverseTransformedValue:(id)value {
	NSLog (@"Reverse Transforming: %@ (%@)", value, [value class]);
	
	return value;
}
@end
