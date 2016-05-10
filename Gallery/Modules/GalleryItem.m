//
//  GalleryItem.m
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "GalleryItem.h"
#import "GalleryCell.h"
#import "Image.h"

@interface GalleryItem()
@property (nonatomic, strong) Image *object;
@end

@implementation GalleryItem

@dynamic object;

- (NSString*)reuseIdentifier
{
    return [GalleryCell className];
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
