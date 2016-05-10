//
//  PGASectionsPresenter+Protected.m
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "PGASectionsPresenter+Protected.h"
#import "PGAMutableCollectionProtocol.h"

@implementation PGASectionsPresenter (Protected)

- (BOOL)canWorkWithSection:(NSInteger)sectionIndex
{
    id<PGAMutableCollectionProtocol>section = (id<PGAMutableCollectionProtocol>)[self sectionAtIndex:sectionIndex];
    return section && [section conformsToProtocol:@protocol(PGAMutableCollectionProtocol)];
}

@end
