//
//  GalleryDetailCell.m
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "GalleryDetailCell.h"
#import "GalleryDetailItem.h"
#import "CacheManager.h"

@interface GalleryDetailCell()
@property (nonatomic, strong) GalleryDetailItem *item;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UIImageView *galleryImage;
@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *activityIndicator;
@end

@implementation GalleryDetailCell
@dynamic item;

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.titleLabel.textColor = [UIColor textColor];
    self.activityIndicator.hidesWhenStopped = YES;
}

- (void)setItem:(GalleryDetailItem*)item
{
    [super setItem:item];
    
    self.titleLabel.text = self.item.title;
    self.imageView.image = nil;
    [self.activityIndicator startAnimating];
    
    
    UIImage *cachedImage = [Cache imageFromCacheWithUrl:[NSURL URLWithString:self.item.imageOriginallURL ]];
    if (cachedImage)
    {
        [self applyImage:cachedImage];
    }
    else
    {
        [UIImage loadImageDataWithURLString:self.item.imageOriginallURL andBlock:^(NSData *imageData)
         {
             UIImage *image = [UIImage imageWithData:imageData];
             [Cache cacheImage:image forURL:[NSURL URLWithString:item.imageOriginallURL]];
             [self applyImage:image];
             
         }];
    }
    
    
}

- (void)applyImage:(UIImage*)image
{

    [self.activityIndicator stopAnimating];
    
    self.galleryImage.image = image;
    self.galleryImage.alpha = 0.0;
    self.galleryImage.hidden = NO;
    
    self.galleryImage.contentMode  = UIViewContentModeScaleToFill;
    self.galleryImage.clipsToBounds = YES;
    [self layoutSubviews];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    [self.galleryImage setAlpha:1.0];
    [UIView commitAnimations];
}



@end

