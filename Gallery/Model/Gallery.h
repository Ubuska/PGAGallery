//
//  Gallery.h
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "BaseObject.h"
@class Image;

@interface Gallery : BaseObject
@property (nonatomic, readwrite) NSMutableArray *items;
@end
