//
//  PGABaseTableViewController.h
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PGACollectionPresenterProtocol.h"
#import "PGAPresenterChangeProtocol.h"

extern const CGFloat kDynamicRowHeight;

@interface PGABaseTableViewController : UITableViewController
@property (nonatomic, strong) id<PGACollectionPresenterProtocol> presenter;
@property (nonatomic, strong, readonly) NSDictionary* cellsPrototypes;

- (instancetype)initWithPresenter:(id<PGACollectionPresenterProtocol>)presenter;

- (CGFloat)rowHeightForItem:(id<PGABaseItemProtocol>)item;
- (UINib*)registerNibForClass:(Class)cellClass;
- (UINib *)registerNibForClass:(Class)cellClass
            forReuseIdentifier:(NSString *)reuseIdentifier;
- (UINib*)registerNibForClass:(Class)cellClass
           forReuseIdentifier:(NSString*)reuseIdentifier
                      nibName:(NSString *)nibName;

@end
