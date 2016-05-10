//
//  PGASingleSectionPresenter.h
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "PGASectionsPresenter.h"
#import "PGAMutableCollectionProtocol.h"
#import "NSMutableArray+Collection.h"

/**
 *  This presenter is used for single section with multiple rows representation.
 *  Rows are represented with items.
 */

@interface PGASingleSectionPresenter : PGASectionsPresenter

+ (BOOL)allowEditing;

- (instancetype)initWithRows:(NSObject<PGAMutableCollectionProtocol>*)rows;
- (void)updateRows:(NSObject<PGACollectionProtocol> *)newRows;

- (NSUInteger)numberOfItems;

- (void)insertItem:(id<PGABaseItemProtocol>)item;
- (void)insertItem:(id<PGABaseItemProtocol>)item atIndex:(NSUInteger)index;
- (void)insertItems:(NSArray*)newItems;
- (void)insertItems:(NSArray*)newItems atIndexes:(NSIndexSet *)indexes;

- (id<PGABaseItemProtocol>)itemAtIndex:(NSUInteger)index;

@property (nonatomic, strong) id<PGAHeaderFooterProtocol> headerItem;
@property (nonatomic, strong) id<PGAHeaderFooterProtocol> footerItem;

@end
