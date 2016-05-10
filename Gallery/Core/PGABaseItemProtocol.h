//
//  PGABaseItemProtocol.h
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PGABaseItemProtocol <NSObject>
@required
- (instancetype)initWithObject:(id)object;
+ (instancetype)itemFromObject:(id)object;
+ (NSArray*)itemsFromObjects:(NSArray*)objects;
- (NSString*)reuseIdentifier;
@end
