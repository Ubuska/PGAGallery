//
//  APIService.h
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OperationEvents.h"
#import "APIRequestObject.h"

@interface APIService : NSObject

- (void)loadRequestWithServiceObject:(APIRequestObject*)requestObject andOperationHandler:(id<OperationEventsHandler>)handler;

@end
