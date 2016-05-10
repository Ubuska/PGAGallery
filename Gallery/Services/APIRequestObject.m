//
//  APIRequestObject.m
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "APIRequestObject.h"

@implementation APIRequestObject

- (NSString*)fixedUrlPath:(NSString*)path
{
    if (path)
    {
        if ([[path substringToIndex:1] isEqualToString:@"/"])
        {
            path = [path substringFromIndex:1];
            return [self fixedUrlPath:path];
        }
        return [path copy];
    }
    return @"";
}

- (instancetype)init
{
    return [self initWithMethod:RequestMethodHTTPGet urlPath:nil];
}

- (instancetype)initWithMethod:(RequestMethod)method
                       urlPath:(NSString*)urlPath
{
    return [self initWithMethod:method urlPath:urlPath parameters:nil];
}
- (instancetype)initWithMethod:(RequestMethod)method
                       urlPath:(NSString*)urlPath
                    parameters:(NSDictionary*)parameters
{
    self = [super init];
    if (self)
    {
        _urlPath = [self fixedUrlPath:urlPath];
        _method = method;
        _parameters = [parameters copy];
    }
    return self;
}

@end
