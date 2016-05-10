//
//  UIViewController+PGAController.m
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "UIViewController+PGAController.h"
#import "LinkedStoryboardPushSegue.h"
#import "UIStoryboardSegue+Delivery.h"

@implementation UIViewController (PGAController)

- (void)openGalleryDetail:(id)object
{
    [self loadControllerWithPushSegueIdentifier:@"Main@GalleryDetail" object:object];
}



- (void)connectWithSegue:(UIStoryboardSegue*)segue
                  object:(id)object
{
    if ([self isKindOfClass:[UINavigationController class]])
    {
        [((UINavigationController*)self).topViewController connectWithSegue:segue object:object];
    }
    //stub
}

- (UIViewController*)loadControllerWithPushSegueIdentifier:(NSString*)pushSegueIdentifier
                                                    object:(id)object
{
    UIStoryboardSegue* segue = nil;
    UIViewController* vc = nil;
    if (pushSegueIdentifier)
    {
        segue = [[LinkedStoryboardPushSegue alloc]
                 initWithIdentifier:pushSegueIdentifier
                 source:self];
    }
    segue.deliveryPack = object;
    [segue performWithConnection];
    return vc;
}

@end

@implementation UIStoryboardSegue (Connections)

- (void)performWithConnection
{
    [self perform];
    [self.destinationViewController connectWithSegue:self object:self.deliveryPack];
}

@end
