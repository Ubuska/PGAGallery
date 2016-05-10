//
//  GalleryPresenter.h
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "PGASingleSectionPresenter.h"

@class Gallery, GalleryItem;

@interface GalleryPresenter : PGASingleSectionPresenter

@property (nonatomic, readonly) GalleryItem* selectedItem;
- (instancetype)initWithGallery:(Gallery*)gallery;

- (void)loadGallery;

@end
