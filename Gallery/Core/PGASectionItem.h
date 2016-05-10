//
//  PGASectionItem.h
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "PGASectionItemProtocol.h"

@interface PGASectionItem : NSObject <PGASectionItemProtocol>

- (instancetype)initWithRows:(NSObject<PGACollectionProtocol>*)rows;

- (void)updateRows:(NSObject<PGACollectionProtocol>*)newRows;

@end
