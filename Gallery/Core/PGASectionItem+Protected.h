//
//  PGASectionItem+Protected.h
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "PGASectionItem.h"
#import "PGACollectionProtocol.h"

@interface PGASectionItem ()
@property (nonatomic, strong, readwrite) NSObject<PGACollectionProtocol>* rows;
@end
