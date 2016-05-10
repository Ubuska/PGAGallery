//
//  Image.h
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "BaseObject.h"

@interface Image : BaseObject

@property (nonatomic, strong) NSString *imageOriginalURL;
@property (nonatomic, strong) NSString *imageThumbnailURL;
@property (nonatomic, strong) NSString *name;

@end
