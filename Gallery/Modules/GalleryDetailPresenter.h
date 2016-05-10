//
//  GalleryDetailPresenter.h
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "PGASingleSectionPresenter.h"

@class Image, GalleryDetailItem;

@interface GalleryDetailPresenter : PGASingleSectionPresenter

- (instancetype)initWithImage:(Image*)image;
- (instancetype)initWithDetailGalleryItem:(GalleryDetailItem*)galleryDetailItem;

@end
