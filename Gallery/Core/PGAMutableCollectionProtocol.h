//
//  PGAMutableCollectionProtocol.h
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PGACollectionProtocol.h"

@protocol PGAMutableCollectionProtocol <PGACollectionProtocol>

- (void)addObject:(id)anObject;
- (void)removeLastObject;
- (void)removeObjectsAtIndexes:(NSIndexSet *)indexes;
- (void)insertObject:(id)anObject atIndex:(NSUInteger)index;
- (void)insertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)removeObject:(id)anObject;
- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;

@end
