//
//  BaseTableViewCell.h
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PGAViewCell.h"
#import "BaseItem.h"

@interface BaseTableViewCell : UITableViewCell <PGAViewCell>

@property (nonatomic, strong) id<PGABaseItemProtocol> item;

@end
