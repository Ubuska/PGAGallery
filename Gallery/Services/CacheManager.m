//
//  CacheManager.m
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "CacheManager.h"

static CacheManager* _cacheManager = nil;

@interface CacheManager ()
@property (nonatomic, strong) NSCache *cache;
@end

@implementation CacheManager

#pragma mark - Initialization

+ (CacheManager*)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        _cacheManager = [[CacheManager alloc] init];
    });
    return _cacheManager;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _cache = [[NSCache alloc] init];
    }
    return self;
}

#pragma mark - Public methods

- (UIImage *)imageFromCacheWithUrl:(NSURL *)url
{
    
    NSString *key = [url absoluteString];
    UIImage *image = [self.cache objectForKey:key];
    return image;
}

- (void)cacheImage:(UIImage*)image forURL:(NSURL*)url
{
    if (image)[self.cache setObject:image forKey:[url absoluteString]];
}

@end
