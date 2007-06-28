//
//  SWFilteringTreeController.h
//
//  Created by James G. Speth on 4/8/06.
//  http://end.com/speth
//

#import <Cocoa/Cocoa.h>


@interface SWPredicateProxy : NSObject {
    id _object;
    NSPredicate *predicate;
}

+ (id)proxyWithObject:(id)object;
- (id)initWithObject:(id)object;
- (NSPredicate *)predicate;
- (void)setPredicate:(NSPredicate *)newPredicate;

@end


@interface NSObject (SWFilteringTreeController)

- (SWPredicateProxy *)predicateProxy;

@end


@interface SWFilteringTreeController : NSTreeController {
    NSPredicate *filterPredicate;
    NSString *realChildrenKeyPath;
}

- (NSPredicate *)filterPredicate;
- (void)setFilterPredicate:(NSPredicate *)newPredicate;
- (void)updateChildrenKeyPath;

@end

