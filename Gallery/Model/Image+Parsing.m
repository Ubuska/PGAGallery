//
//  Image+Parsing.m
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "Image+Parsing.h"
#import "BaseObject+Parsing.h"

@implementation Image (Parsing)


- (void)updateWithDictionary:(NSDictionary *)values
{
    [super updateWithDictionary:values];
    
    self.imageOriginalURL = values[@"url"];
    self.imageThumbnailURL = values[@"url_tn"];
    self.name = values[@"name"];
}

@end
