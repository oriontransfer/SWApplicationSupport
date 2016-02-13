//
//  NSObject+BindingPropagation.m
//  Truth Tables
//
//  Created by Samuel Williams on 20/11/11.
//  Copyright (c) 2011 Orion Transfer Ltd. All rights reserved.
//

#import "NSObject+BindingPropagation.h"
#import <AppKit/NSKeyValueBinding.h>

@implementation NSObject (BindingPropagation)

-(void) propagateValue:(id)value forBinding:(NSString*)binding
{
	NSParameterAssert(binding != nil);
	
	//WARNING: bindingInfo contains NSNull, so it must be accounted for
	NSDictionary* bindingInfo = [self infoForBinding:binding];
	
	if (!bindingInfo)
		return; //there is no binding
	
	//apply the value transformer, if one has been set
	NSDictionary* bindingOptions = bindingInfo[NSOptionsKey];
	if (bindingOptions){
		NSValueTransformer * transformer = [bindingOptions valueForKey:NSValueTransformerBindingOption];
		if (!transformer || (id)transformer == [NSNull null]) {
			NSString * transformerName = [bindingOptions valueForKey:NSValueTransformerNameBindingOption];
			if (transformerName && (id)transformerName != [NSNull null]) {
				transformer = [NSValueTransformer valueTransformerForName:transformerName];
			}
		}
		
		if (transformer && (id)transformer != [NSNull null]){
			if ([[transformer class] allowsReverseTransformation]){
				value = [transformer reverseTransformedValue:value];
			} else {
				NSLog(@"WARNING: binding \"%@\" has value transformer, but it doesn't allow reverse transformations in %s", binding, __PRETTY_FUNCTION__);
			}
		}
	}
	
	id boundObject = bindingInfo[NSObservedObjectKey];
	if (!boundObject || boundObject == [NSNull null]) {
		NSLog(@"ERROR: NSObservedObjectKey was nil for binding \"%@\" in %s", binding, __PRETTY_FUNCTION__);
		return;
	}
	
	NSString* boundKeyPath = bindingInfo[NSObservedKeyPathKey];
	if (!boundKeyPath || (id)boundKeyPath == [NSNull null]) {
		NSLog(@"ERROR: NSObservedKeyPathKey was nil for binding \"%@\" in %s", binding, __PRETTY_FUNCTION__);
		return;
	}
	
	[boundObject setValue:value forKeyPath:boundKeyPath];
}

@end
