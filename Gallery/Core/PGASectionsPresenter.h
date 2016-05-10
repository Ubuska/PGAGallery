//
//  PGASectionsPresenter.h
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PGACollectionPresenterProtocol.h"
#import "PGACollectionProtocol.h"
#import "PGASectionItem.h"
#import "NSArray+Collection.h"

@interface PGASectionsPresenter : NSObject <PGACollectionPresenterProtocol>

- (instancetype)initWithSections:(NSObject<PGACollectionProtocol> *)sections;
- (id<PGASectionItemProtocol>)sectionAtIndex:(NSUInteger)index;
- (NSUInteger)indexForSection:(id<PGASectionItemProtocol>)section;

- (void)reloadSections;
- (void)updateSections:(NSObject<PGACollectionProtocol> *)newSections;
- (void)insertItem:(id<PGABaseItemProtocol>)item inSection:(NSUInteger)section;
- (void)insertItem:(id<PGABaseItemProtocol>)item atIndexPath:(NSIndexPath *)indexPath;
- (void)insertItems:(NSArray*)items inSection:(NSUInteger)section;
- (void)insertItems:(NSArray*)items atIndexes:(NSIndexSet *)indexes
          inSection:(NSUInteger)section;

- (void)removeItemAtIndexPath:(NSIndexPath *)indexPath;
- (void)removeItem:(id<PGABaseItemProtocol>)item;
- (void)removeItemsAtIndexPathes:(NSArray*)indexPathes;
- (void)removeItemsAtIndexes:(NSIndexSet*)indexes inSection:(NSUInteger)section;

- (void)replaceItem:(id<PGABaseItemProtocol>)item withItem:(id<PGABaseItemProtocol>)otherItem;
- (void)replaceItemAtIndexPath:(NSIndexPath *)indexPath withItem:(id<PGABaseItemProtocol>)otherItem;

@end
