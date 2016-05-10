//
//  PGASectionItemProtocol.h
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "PGACollectionProtocol.h"

@protocol PGAHeaderFooterProtocol;
@protocol PGASectionItemProtocol <PGACollectionProtocol>



@property (nonatomic, strong) id<PGAHeaderFooterProtocol> headerItem;
@property (nonatomic, strong) id<PGAHeaderFooterProtocol> footerItem;
- (void)didSelectItemAtIndex:(NSUInteger)index;
@end
