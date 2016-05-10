//
//  OperationEvents.h
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol OperationEventsHandler <NSObject>

@required
- (void)operationNext:(id)object;
- (void)operationError:(NSError*)error;
- (void)operationCompleted;

@end
