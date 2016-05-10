//
//  UIStoryboard+Links.m
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "UIStoryboard+Links.h"

static NSString *const kDelimeter = @"@";

@implementation UIStoryboard (Links)

+ (UIViewController *)sceneNamed:(NSString *)identifier
{
    NSString *storyboardName = nil;
    NSString *sceneName = nil;
    
    NSCharacterSet *spaces = [NSCharacterSet characterSetWithCharactersInString:@" \t\n"];
    
    if ([identifier hasPrefix:kDelimeter])
    {
        storyboardName = [identifier substringFromIndex:1];
    }
    else
    {
        NSArray *parts = [identifier componentsSeparatedByString:kDelimeter];
        sceneName = [parts safeObjectAtIndex:1];
        storyboardName = parts.firstObject;
    }
    
    UIStoryboard *storyboard = nil;
    UIViewController *scene = nil;
    
    if (storyboardName.length > 0)
    {
        storyboardName = [storyboardName stringByTrimmingCharactersInSet:spaces];
    }
    if (sceneName.length > 0)
    {
        sceneName = [sceneName stringByTrimmingCharactersInSet:spaces];
    }
    
    NSBundle* main = [NSBundle mainBundle];
    if (storyboardName.length || sceneName.length)
    {
        if (![main hasStoryboardWithName:storyboardName] && [main hasStoryboardWithName:sceneName])
        {
            //lol you changed places of storyboard and controller
            NSString* tmp = [sceneName copy];
            sceneName = [storyboardName copy];
            storyboardName = [tmp copy];
        }
        if ([main hasStoryboardWithName:storyboardName])
        {
            storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:main];
            if (sceneName.length == 0)
            {
                scene = [storyboard instantiateInitialViewController];
            }
            else
            {
                scene = [storyboard instantiateViewControllerWithIdentifier:sceneName];
            }
        }
        else
        {
            NSAssert(NO, @"UIStoryboard+Links: I can't find storyboard");
        }
    }
    
    return scene;
}
@end
