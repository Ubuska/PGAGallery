//
//  GalleryDetailItem.h
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "BaseItem.h"

@interface GalleryDetailItem : BaseItem

@property (nonatomic, readonly) NSString* title;
@property (nonatomic, readonly) NSString* imageThumbnailURL;
@property (nonatomic, readonly) NSString* imageOriginallURL;

@end
