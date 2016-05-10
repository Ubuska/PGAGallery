//
//  PGASectionsPresenter.m
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "PGASectionsPresenter+Protected.h"
#import "PGASectionsPresenter.h"
#import <UIKit/UIKit.h>

@interface PGASectionsPresenter()
@property (nonatomic, strong, readwrite) NSObject<PGACollectionProtocol>* sections;
@end

@implementation PGASectionsPresenter

#pragma mark - Initialization
- (instancetype)init
{
    return [self initWithSections:nil];
}

- (instancetype)initWithSections:(NSObject<PGACollectionProtocol> *)sections
{
    self = [super init];
    if (self)
    {
        self.sections = sections;
    }
    return self;
}

#pragma mark - Public methods
- (void)reloadSections
{
    [self updateSections:self.sections];
}
- (void)updateSections:(NSObject<PGACollectionProtocol> *)newSections
{
    self.sections = newSections;
}

- (void)insertItem:(id<PGABaseItemProtocol>)item inSection:(NSUInteger)section
{
    [self insertItem:item atIndexPath:[NSIndexPath indexPathForItem:[self numberOfItemsInSection:section] inSection:section]];
}
- (void)insertItems:(NSArray *)items inSection:(NSUInteger)section
{
    [self insertItems:items atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange([self numberOfItemsInSection:section], items.count)] inSection:section];
}
- (void)insertItem:(id<PGABaseItemProtocol>)item atIndexPath:(NSIndexPath *)indexPath
{
    [self insertItems:@[item] atIndexes:[NSIndexSet indexSetWithIndex:indexPath.item]
            inSection:indexPath.section];
}
- (void)insertItems:(NSArray *)items atIndexes:(NSIndexSet *)indexes
          inSection:(NSUInteger)sectionIndex
{
    if (items.count > 0 && items.count == indexes.count && [self canWorkWithSection:sectionIndex])
    {
        id<PGAMutableCollectionProtocol>section = (id<PGAMutableCollectionProtocol>)[self sectionAtIndex:sectionIndex];
        [section insertObjects:items atIndexes:indexes];
    }
    else if (items.count > 0)
    {
        NSLog(@"Can't insert items %@ atIndexes: %@", items, indexes.debugDescription);
    }
}

- (void)removeItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath && [self canWorkWithSection:indexPath.section])
    {
        id<PGAMutableCollectionProtocol>section = (id<PGAMutableCollectionProtocol>)[self sectionAtIndex:indexPath.section];
        [section removeObjectAtIndex:indexPath.item];
    }
    else if (indexPath)
    {
        NSLog(@"Can't remove item atIndexPath: %@", indexPath.debugDescription);
    }
}

- (void)removeItem:(id<PGABaseItemProtocol>)item
{
    [self removeItemAtIndexPath:[self indexPathForItem:item]];
}

- (void)removeItemsAtIndexes:(NSIndexSet *)indexes inSection:(NSUInteger)sec
{
    
    if (indexes.count > 0 && [self canWorkWithSection:sec])
    {
        id<PGAMutableCollectionProtocol>section = (id<PGAMutableCollectionProtocol>)[self sectionAtIndex:sec];
        [section removeObjectsAtIndexes:indexes];
    }
    else if (indexes)
    {
        NSLog(@"Can't remove item atIndexes: %@", indexes);
    }
}

- (void)removeItemsAtIndexPathes:(NSArray*)indexPathes
{
    if (indexPathes.count > 0)
    {
        for (NSUInteger sec = 0; sec < self.numberOfSections; sec++)
        {
            if ([self canWorkWithSection:sec])
            {
                NSMutableIndexSet* itemsSet = [NSMutableIndexSet new];
                for (NSIndexPath* idpx in indexPathes)
                {
                    if (idpx.section == sec)
                    {
                        [itemsSet addIndex:idpx.item];
                    }
                }
                [self removeItemsAtIndexes:itemsSet inSection:sec];
            }
        }
    }
}

- (void)replaceItem:(id<PGABaseItemProtocol>)item withItem:(id<PGABaseItemProtocol>)otherItem
{
    NSIndexPath* indexPath = [self indexPathForItem:item];
    [self replaceItemAtIndexPath:indexPath withItem:otherItem];
}

- (void)replaceItemAtIndexPath:(NSIndexPath *)indexPath withItem:(id<PGABaseItemProtocol>)otherItem
{
    if (!otherItem)
    {
        return [self removeItemAtIndexPath:indexPath];
    }
    if (indexPath && [self canWorkWithSection:indexPath.section])
    {
        id<PGAMutableCollectionProtocol>section = (id<PGAMutableCollectionProtocol>)[self sectionAtIndex:indexPath.section];
        [section replaceObjectAtIndex:indexPath.item withObject:otherItem];
    }
    else if (indexPath)
    {
        NSLog(@"Can't replace item atIndexPath: %@", indexPath.debugDescription);
    }
}


#pragma mark - Private methods

- (id<PGASectionItemProtocol>)sectionAtIndex:(NSUInteger)index
{
    return index < self.sections.count ? [self.sections objectAtIndex:index] : nil;
}
- (NSUInteger)indexForSection:(id<PGASectionItemProtocol>)section
{
    for (NSUInteger i=0; i< self.numberOfSections; i++)
    {
        id<PGASectionItemProtocol> mySection = [self sectionAtIndex:i];
        if (mySection == section)
        {
            return i;
        }
    }
    return NSNotFound;
}


#pragma mark - PGACollectionPresenterProtocol implementations
- (NSUInteger)numberOfObjects
{
    NSUInteger res = 0;
    for (NSUInteger sec; sec < self.numberOfSections; sec++){
        res+=[self numberOfItemsInSection:sec];
    }
    return res;
}
- (NSUInteger)numberOfSections
{
    return self.sections.count;
}
- (NSUInteger)numberOfItemsInSection:(NSUInteger)index
{
    return [self sectionAtIndex:index].count;
}
- (id<PGABaseItemProtocol>)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return [[self sectionAtIndex:indexPath.section] objectAtIndex:indexPath.item];
}

- (NSIndexPath *)indexPathForItem:(id<PGABaseItemProtocol>)item
{
    NSUInteger sec = 0;
    NSUInteger row = NSNotFound;
    for (NSUInteger i=0; i< self.numberOfSections; i++)
    {
        id<PGASectionItemProtocol> section = [self sectionAtIndex:i];
        row = [section indexOfObject:item];
        if (row != NSNotFound)
        {
            break;
        }
        sec++;
    }
    return row != NSNotFound ? [NSIndexPath indexPathForItem:row inSection:sec] : nil;
}
@end
