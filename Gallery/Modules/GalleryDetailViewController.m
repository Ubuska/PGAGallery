//
//  GalleryDetailViewController.m
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "GalleryDetailViewController.h"
#import "GalleryDetailPresenter.h"
#import "GalleryItem.h"
#import "GalleryDetailItem.h"
#import "GalleryDetailCell.h"
#import "Gallery.h"
#import "Image.h"

@interface GalleryDetailViewController ()
@property (nonatomic, strong) GalleryDetailPresenter *presenter;
@end

@implementation GalleryDetailViewController
@dynamic presenter;

#pragma mark - Initialize

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self registerNibForClass:[GalleryDetailCell class] forReuseIdentifier:[GalleryDetailCell className]];
}

- (CGFloat)rowHeightForItem:(id<PGABaseItemProtocol>)item
{
    return [Utils screenHeight];
}

#pragma mark - Navigation

- (void)connectWithSegue:(UIStoryboardSegue *)segue object:(id)object
{
    [super connectWithSegue:segue object:object];
    if ([object isKindOfClass:[GalleryItem class]])
    {
        // Area for improvement - map one item into another.
        GalleryItem *item = (GalleryItem*)object;
        GalleryDetailItem *detailItem = [[GalleryDetailItem alloc] initWithObject:item.object];
        self.presenter = [[GalleryDetailPresenter alloc] initWithDetailGalleryItem:detailItem];
        
    }
    
    
}

@end
