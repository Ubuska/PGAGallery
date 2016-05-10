//
//  BaseObject+Parsing.m
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "BaseObject+Parsing.h"

@implementation BaseObject (Parsing)

- (instancetype)initWithDictionary:(NSDictionary *)values
{
    //if ([values isKindOfClass:[NSDictionary class]])
    //{

        self = [super init];
        if (self)
        {
            [self updateWithDictionary:values];
        }
        return self;
    //}
    
    //return nil;
}

- (void)updateWithDictionary:(NSDictionary *)values
{
    //stub
}

@end
