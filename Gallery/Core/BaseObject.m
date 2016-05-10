//
//  BaseObject.m
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "BaseObject.h"
#import "BaseObject+Protected.h"

@implementation BaseObject

- (instancetype)initWithIdentifier:(NSNumber *)identifier
{
    self = [super init];
    if (self)
    {
        _identifier = [identifier copy];
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone
{
    return [[[self class] allocWithZone:zone] initWithIdentifier:self.identifier];
}

- (NSString *)debugDescription
{
    return [NSString stringWithFormat:@"%@ ID:%@", self, self.identifier];
}

@end

@implementation BaseObject (Protected)

- (void)setIdentifier:(NSNumber *)identifier
{
    _identifier = [identifier copy];
}


@end
