//
//  BaseItem.m
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "BaseItem.h"

@implementation BaseItem

- (instancetype)initWithObject:(BaseObject *)object
{
    self = [super init];
    if (self)
    {
        _object = object;
    }
    return self;
}

+ (instancetype)itemFromObject:(BaseObject *)object
{
    return [[[self class] alloc] initWithObject:object];
}

+ (NSArray*)itemsFromObjects:(NSArray*)objects
{
    NSMutableArray* items = [NSMutableArray arrayWithCapacity:objects.count];
    for (BaseObject* object in objects)
    {
        [items addObjectSafety:[[self class] itemFromObject:object]];
    }
    return [items copy];
}

- (NSString*)debugDescription
{
    return [NSString stringWithFormat:@"%@ with object:%@", self, [self.object debugDescription]];
}

- (NSString*)reuseIdentifier
{
    return nil;
}

@end
