//
//  UIStoryboardSegue+Delivery.m
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "UIStoryboardSegue+Delivery.h"
#import <objc/runtime.h>

static void* kDeliveryContextKey = &kDeliveryContextKey;

@implementation UIStoryboardSegue (Delivery)

- (id)deliveryPack
{
    return objc_getAssociatedObject(self, kDeliveryContextKey);
}
- (void)setDeliveryPack:(id)deliveryPack
{
    objc_setAssociatedObject(self, kDeliveryContextKey, deliveryPack, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
