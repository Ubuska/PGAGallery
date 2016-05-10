//
//  Gallery+Parsing.m
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "Gallery+Parsing.h"
#import "BaseObject+Parsing.h"
#import "Image.h"

@implementation Gallery (Parsing)

- (void)updateWithDictionary:(NSDictionary *)values
{
    [super updateWithDictionary:values];
    if ([values isKindOfClass:[NSArray class]])
    {
        self.items = [[NSMutableArray alloc] init];
        for (NSDictionary *dict in values)
        {
            Image *newImage = [[Image alloc] initWithDictionary:dict];
            [self.items addObjectSafety:newImage];
        }
    }
}

@end
