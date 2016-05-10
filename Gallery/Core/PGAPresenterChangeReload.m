//
//  PGAPresenterChangeReload.m
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "PGAPresenterChangeReload.h"

@implementation PGAPresenterChangeReload

- (void)updateTableView:(UITableView*)tableView
{
    [self updateTableView:tableView withAnimation:UITableViewRowAnimationFade];
}
- (void)updateTableView:(UITableView *)tableView withAnimation:(UITableViewRowAnimation)animation
{
    [tableView reloadData];
}
- (void)updateCollectionView:(UICollectionView*)collectionView
{
    [collectionView reloadData];
}

@end
