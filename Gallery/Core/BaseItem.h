//
//  BaseItem.h
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "BaseObject.h"
#import "PGABaseItemProtocol.h"

@interface BaseItem : NSObject <PGABaseItemProtocol>

@property (nonatomic, strong) BaseObject* object;

@end
