//
//  CacheManager.h
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import <Foundation/Foundation.h>

#define Cache [CacheManager sharedInstance]

@interface CacheManager : NSObject

+ (CacheManager*)sharedInstance;
- (UIImage *)imageFromCacheWithUrl:(NSURL *)url;
- (void)cacheImage:(UIImage*)image forURL:(NSURL*)url;

@end
