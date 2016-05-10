//
//  PGAViewCell.h
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "PGABaseItemProtocol.h"

@protocol PGAViewCell <NSObject>

@property (nonatomic, strong) id<PGABaseItemProtocol> item;

@end
