//
//  PGASectionItem.m
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "PGASectionItem.h"
#import "PGASectionItem+Protected.h"
#import "PGABaseItemProtocol.h"


@implementation PGASectionItem

@synthesize headerItem = _headerItem;
@synthesize footerItem = _footerItem;

#pragma mark - Initialization
- (instancetype)init
{
    return [self initWithRows:nil];
}

- (instancetype)initWithRows:(NSObject<PGACollectionProtocol> *)rows
{
    self = [super init];
    if (self)
    {
        self.rows = rows;
    }
    return self;
}

#pragma mark - public methods
- (void)updateRows:(NSObject<PGACollectionProtocol> *)newRows
{
    self.rows = newRows;
}

#pragma mark - CollectionProtocol
- (NSUInteger)count
{
    return self.rows.count;
}

- (id<PGABaseItemProtocol>)objectAtIndex:(NSUInteger)index
{
    return index < self.count ? [self.rows objectAtIndex:index] : nil;
}

- (NSUInteger)indexOfObject:(id)anObject
{
    return [self.rows indexOfObject:anObject];
}


@end
