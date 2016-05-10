//
//  UIViewController+Styling.m
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "UIViewController+Styling.h"

@implementation UIViewController (Styling)
+ (BOOL)hasStylingApplied
{
    return YES;
}
- (void)applyStyling
{
    if ([[self class] hasStylingApplied])
    {
        self.view.backgroundColor = [UIColor mainColor];
        [[UINavigationBar appearance] setBarTintColor:[UIColor accentColor]];
        [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    }
    
}

@end
