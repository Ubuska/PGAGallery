//
//  GalleryDetailPresenter.m
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "GalleryDetailPresenter.h"
#import "Image.h"
#import "GalleryDetailItem.h"

@interface GalleryDetailPresenter ()
@property (nonatomic, strong) Image* image;
@end

@implementation GalleryDetailPresenter


- (instancetype)initWithImage:(Image*)image
{
    GalleryDetailItem *item = [[GalleryDetailItem alloc] initWithObject:image];
    self = [self initWithDetailGalleryItem:item];
    if (self)
    {
        _image = image;
    }
    return self;
}
- (instancetype)initWithDetailGalleryItem:(GalleryDetailItem*)galleryDetailItem
{
    self = [super initWithRows:[@[galleryDetailItem] mutableCopy]];
    if (self)
    {
    }
    return self;
}

@end
