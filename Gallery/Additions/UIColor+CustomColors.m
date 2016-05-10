//
//  UIColor+CustomColors.m
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "UIColor+CustomColors.h"

@implementation UIColor (CustomColors)

+ (UIColor*)accentColor
{
    return [UIColor colorWithHexString:@"A5BD9B"];
}
+ (UIColor*)textColor
{
    return [UIColor colorWithHexString:@"FFFFFF"];
}
+ (UIColor*)mainColor
{
    return [UIColor colorWithHexString:@"0C0C0C"];
}

@end
