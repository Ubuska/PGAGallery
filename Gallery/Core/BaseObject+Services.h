//
//  BaseObject+Services.h
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "BaseObject.h"
#import "OperationEvents.h"


@class APIRequestObject;
@interface BaseObject (Services)

+ (void)loadRequestWithServiceObject:(APIRequestObject*)requestObject andOperationHandler:(id<OperationEventsHandler>)handler;
@end
