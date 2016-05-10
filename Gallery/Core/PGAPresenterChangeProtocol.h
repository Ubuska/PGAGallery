//
//  PGAPresenterChangeProtocol.h
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol PGAPresenterChangeProtocol <NSObject>

- (void)updateTableView:(UITableView*)tableView;
- (void)updateTableView:(UITableView *)tableView withAnimation:(UITableViewRowAnimation)animation;
- (void)updateCollectionView:(UICollectionView*)collectionView;

@end

@protocol PGAPresenterChangeSectionProtocol <PGAPresenterChangeProtocol>

//- (instancetype)initWithIndex:(NSUInteger)index;
//- (instancetype)initWithIndexSet:(NSIndexSet)indexSet;

@end
