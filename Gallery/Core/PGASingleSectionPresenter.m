//
//  PGASingleSectionPresenter.m
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PGASingleSectionPresenter.h"
#import "PGAUtils.h"



@class PGAMutableSectionItem;
@interface PGASingleSectionPresenter ()

@property (nonatomic, strong) PGASectionItem* section;

@end

@implementation PGASingleSectionPresenter

+ (BOOL)allowEditing
{
    return NO;
}

- (instancetype)init
{
    return [self initWithRows:nil];
}

- (instancetype)initWithSections:(NSObject<PGACollectionProtocol> *)sections
{
    NSMutableArray* rows = [@[] mutableCopy];
    for (NSUInteger j = 0; j < sections.count; j++)
    {
        NSObject<PGACollectionProtocol>*col = [sections objectAtIndex:j];
        for (NSUInteger i = 0; i < col.count; i++)
        {
            id obj = [col objectAtIndex:i];
            [rows addObjectSafety:obj];
        }
    }
    return [self initWithRows:rows];
}

- (instancetype)initWithRows:(NSObject<PGAMutableCollectionProtocol> *)rows
{
    /*PGASectionItem* section = [[self class] allowEditing]
    ? [[PGAMutableSectionItem alloc] initWithRows:rows]
    : [[PGASectionItem alloc] initWithRows:rows];*/
    PGASectionItem* section = [[PGASectionItem alloc] initWithRows:rows];
    self = [super initWithSections:@[section]];
    if (self)
    {
        _section = section;
    }
    return self;
}
- (void)updateRows:(NSObject<PGACollectionProtocol> *)newRows
{
    [self.section updateRows:newRows];
}

- (NSUInteger)numberOfItems
{
    return [self numberOfItemsInSection:0];
}

- (void)insertItem:(id<PGABaseItemProtocol>)item
{
    [self insertItem:item atIndex:self.numberOfItems];
}
- (void)insertItem:(id<PGABaseItemProtocol>)item atIndex:(NSUInteger)index
{
    [super insertItem:item atIndexPath:[NSIndexPath indexPathForItem:index inSection:0]];
}
- (void)insertItems:(NSArray *)newItems
{
    [super insertItems:newItems inSection:0];
}
- (void)insertItems:(NSArray *)newItems atIndexes:(NSIndexSet *)indexes
{
    [super insertItems:newItems atIndexes:indexes inSection:0];
}

- (id<PGABaseItemProtocol>)itemAtIndex:(NSUInteger)index
{
    return [self itemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0]];
}

- (id<PGAHeaderFooterProtocol>)headerItem
{
    return self.section.headerItem;
}
- (void)setHeaderItem:(id<PGAHeaderFooterProtocol>)headerItem
{
    self.section.headerItem = headerItem;
}
- (id<PGAHeaderFooterProtocol>)footerItem
{
    return self.section.footerItem;
}
- (void)setFooterItem:(id<PGAHeaderFooterProtocol>)footerItem
{
    self.section.footerItem = footerItem;
}

@end
