//
//  BaseObject.h
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OperationEvents.h"

@interface BaseObject : NSObject <NSCopying>

@property (nonatomic, weak) id<OperationEventsHandler> instigator;
@property (nonatomic, copy, readonly) NSNumber* identifier;
- (instancetype)initWithIdentifier:(NSNumber*)identifier;

@end
