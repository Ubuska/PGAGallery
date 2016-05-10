//
//  PGACollectionProtocol.h
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PGACollectionProtocol <NSObject>

@property (nonatomic, readonly) NSUInteger count;
- (id)objectAtIndex:(NSUInteger)index;
- (NSUInteger)indexOfObject:(id)anObject;

@end
