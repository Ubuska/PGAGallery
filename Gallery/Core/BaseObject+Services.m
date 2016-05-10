//
//  BaseObject+Services.m
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "BaseObject+Services.h"
#import "BaseObject+Parsing.h"
#import "APIService.h"

@interface BaseObject() <OperationEventsHandler>

@end

@implementation BaseObject (Services)

+ (void)loadRequestWithServiceObject:(APIRequestObject*)requestObject andOperationHandler:(id<OperationEventsHandler>)handler
{
    APIService *apiService = [APIService new];
    BaseObject *this = [[self alloc] init];
    this.instigator = handler;
    [apiService loadRequestWithServiceObject:requestObject andOperationHandler:this];
}

        
- (void)operationNext:(NSData*)data
{
    if (data != nil)
    {
        // Convert the returned data into a dictionary.
        NSError *error;
        NSMutableDictionary *returnedDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        if (error != nil)
        {
            NSLog(@"%@", [error localizedDescription]);
            [self.instigator operationError:error];
            [self.instigator operationCompleted];
            return;
        }
        else
        {
           [self initWithDictionary:returnedDict];
            [self.instigator operationNext:self];
            [self.instigator operationCompleted];
            
        }
    }
    
}
- (void)operationError:(NSError*)error
{
    [self.instigator operationError:error];
    [self.instigator operationCompleted];
}
- (void)operationCompleted
{
    [self.instigator operationCompleted];
}

@end
