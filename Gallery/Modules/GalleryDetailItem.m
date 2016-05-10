//
//  GalleryDetailItem.m
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "GalleryDetailItem.h"
#import "GalleryDetailCell.h"
#import "Image.h"

@interface GalleryDetailItem()
@property (nonatomic, strong) Image *object;
@end

@implementation GalleryDetailItem
@dynamic object;

- (NSString*)reuseIdentifier
{
    return [GalleryDetailCell className];
}

- (NSString*)title
{
    return self.object.name;
}
- (NSString*)imageThumbnailURL
{
    return self.object.imageThumbnailURL;
}
- (NSString*)imageOriginallURL
{
    return self.object.imageOriginalURL;
}
@end
