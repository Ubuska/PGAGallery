//
//  UIStoryboardSegue+LinkedStoryboardPushSegue.m
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "LinkedStoryboardPushSegue.h"
#import "UIStoryboard+Links.h"

@implementation LinkedStoryboardPushSegue

- (id)initWithIdentifier:(NSString *)identifier source:(UIViewController *)source
{
    return [self initWithIdentifier:identifier source:source destination:[UIViewController new]];
}

- (id)initWithIdentifier:(NSString *)identifier source:(UIViewController *)source destination:(UIViewController *)destination
{
    return [super initWithIdentifier:identifier source:source destination:[UIStoryboard sceneNamed:identifier]];
}

- (void)perform
{
    UIViewController *source = (UIViewController *)self.sourceViewController;
    [source.navigationController pushViewController:self.destinationViewController animated:YES];
}

@end
