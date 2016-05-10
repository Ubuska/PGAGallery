//
//  GalleryPresenter.m
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "GalleryPresenter.h"
#import "Gallery.h"
#import "Image.h"
#import "Gallery+Services.h"
#import "GalleryItem.h"
#import "APIService.h"

@interface GalleryPresenter () <OperationEventsHandler>
@property (nonatomic, strong) Gallery* gallery;
@end

@implementation GalleryPresenter

@synthesize listener = _listener;

- (instancetype)initWithGallery:(Gallery*)gallery
{
    NSArray *items = [gallery.items mapLike:^id(Image *image)
                      {
                          GalleryItem *item = [[GalleryItem alloc] initWithObject:image];
                          return item;
                      }];
    self = [super initWithRows:[items mutableCopy]];
    if (self)
    {
        _gallery = gallery;
    }
    return self;
}

#pragma mark - Public methods

- (void)loadGallery
{
    [Gallery loadGallery:self];
}

#pragma mark - Presenter functionality

- (void)didSelectItemAtIndexPath:(NSIndexPath *)indexPath completion:(dispatch_block_t)completion
{
    if (completion)
    {
        completion();
    }
}

- (BOOL)canEditItemAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

#pragma mark - OperationEventHandler

- (void)operationNext:(Gallery*)gallery
{
    [self initWithGallery:gallery];
    [self.listener presenterStateChanged];

}
- (void)operationError:(NSError*)error
{
    // Show alert here
}
- (void)operationCompleted
{
    // Stop animating activity indicators, etc...
}

@end
