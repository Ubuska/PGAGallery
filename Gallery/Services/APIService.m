//
//  APIService.m
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "APIService.h"


@implementation APIService

- (void)downloadDataWithRequestObject:(APIRequestObject*)requestObject andOperationHandler:(id<OperationEventsHandler>)handler
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:[NSURL URLWithString:requestObject.urlPath] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
        
        if (error != nil)
        {
            NSLog(@"%@", [error localizedDescription]);
            [self downloadError:error withOperationHandler:handler];
        }
        else
        {
            NSInteger HTTPStatusCode = [(NSHTTPURLResponse *)response statusCode];
            
            // If it's other than 200, then show it on the console.
            if (HTTPStatusCode != 200)
            {
                NSLog(@"HTTP status code = %d", HTTPStatusCode);
            }
            
            // Call the completion handler with the returned data on the main thread.
            [self downloadWithData:data withOperationHandler:handler];
            
        }
    }];
    [task resume];
}


- (void)loadRequestWithServiceObject:(APIRequestObject*)requestObject andOperationHandler:(id<OperationEventsHandler>)handler
{
    switch (requestObject.method)
    {
        case RequestMethodExternalFile:
            [self downloadDataWithRequestObject:requestObject andOperationHandler:handler];
            break;
            
        default:
            break;
    }
}
#pragma mark - OperationEvents


- (void)downloadError:(NSError *)error withOperationHandler:(id<OperationEventsHandler>)handler
{
    dispatch_sync(dispatch_get_main_queue(), ^
    {
        [handler operationError:error];
        [handler operationCompleted];
    });
    
}

- (void)downloadWithData:(NSData*)data withOperationHandler:(id<OperationEventsHandler>)handler
{
    dispatch_sync(dispatch_get_main_queue(), ^
                  {
                      [handler operationNext:data];
                  });
    
}

@end
