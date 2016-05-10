//
//  Gallery+Services.m
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "Gallery+Services.h"
#import "BaseObject+Services.h"
#import "APIRequestObject.h"

@implementation Gallery (Services)

+ (void)loadGallery:(id<OperationEventsHandler>)handler
{
    APIRequestObject *requestObject = [[APIRequestObject alloc] initWithMethod:RequestMethodExternalFile urlPath:@"https://api.myjson.com/bins/5b2ai"];
    [self loadRequestWithServiceObject:requestObject andOperationHandler:handler];
}

@end
