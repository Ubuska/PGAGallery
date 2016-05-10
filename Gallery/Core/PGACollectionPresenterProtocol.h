//
//  PGACollectionPresenterProtocol.h
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PGABaseItemProtocol.h"
#import "PGAPresenterListenerProtocol.h"

@protocol PGACollectionPresenterProtocol <NSObject>

@required
@property (nonatomic, weak) id<PGAPresenterListenerProtocol>listener;
- (NSUInteger)numberOfSections;
- (NSUInteger)numberOfItemsInSection:(NSUInteger)section;
- (id<PGABaseItemProtocol>)itemAtIndexPath:(NSIndexPath *)indexPath;
@optional
//@property (nonatomic, copy, readonly) NSString* title;

- (NSUInteger)numberOfObjects;
- (BOOL)canEditItemAtIndexPath:(NSIndexPath*)indexPath;
- (void)didSelectItemAtIndexPath:(NSIndexPath*)indexPath
                      completion:(dispatch_block_t)completion;
- (void)didSelectItemAtIndexPath:(NSIndexPath*)indexPath
                completionResult:(void(^)(NSString *segueIdentifier, id sender))completion;
- (void)commitDeleteForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)commitInsertForRowAtIndexPath:(NSIndexPath *)indexPath;

- (NSIndexPath*)indexPathForItem:(id<PGABaseItemProtocol>)item;
@end
