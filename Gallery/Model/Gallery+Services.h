//
//  Gallery+Services.h
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "Gallery.h"
#import "OperationEvents.h"

/**
 *  Here we can make many services related to this model class.
 */

@interface Gallery (Services)
+ (void)loadGallery:(id<OperationEventsHandler>)handler;
@end
