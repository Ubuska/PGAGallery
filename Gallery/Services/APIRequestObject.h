//
//  APIRequestObject.h
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger
{
    RequestMethodExternalFile,
    RequestMethodHTTPPost,
    RequestMethodHTTPGet
} RequestMethod;

@interface APIRequestObject : NSObject

@property (nonatomic, readonly) RequestMethod method;
@property (nonatomic, strong, readonly) NSDictionary* parameters;
@property (nonatomic, copy, readonly) NSString* urlPath;
@property (nonatomic, strong, readonly) NSArray* bodyArray;

@property (nonatomic, strong) NSProgress* progress;

- (instancetype)initWithMethod:(RequestMethod)method
                       urlPath:(NSString*)urlPath;
- (instancetype)initWithMethod:(RequestMethod)method
                       urlPath:(NSString*)urlPath
                    parameters:(NSDictionary*)parameters;

@end
