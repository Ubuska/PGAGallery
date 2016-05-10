//
//  ViewController.m
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "GalleryViewController.h"
#import "GalleryPresenter.h"
#import "GalleryItem.h"
#import "GalleryCell.h"
#import "Gallery.h"
#import "Image.h"

@interface GalleryViewController ()
@property (nonatomic, strong) GalleryPresenter *presenter;
@property (nonatomic) NSIndexPath *selectedIndexPath;
@end

@implementation GalleryViewController
@dynamic presenter;

- (void)awakeFromNib
{
    [super awakeFromNib];

    self.presenter = [[GalleryPresenter alloc] init];
    self.presenter.listener = self;
    [self.presenter loadGallery];
    
    [self registerNibForClass:[GalleryCell class] forReuseIdentifier:[GalleryCell className]];
}

- (CGFloat)rowHeightForItem:(id<PGABaseItemProtocol>)item
{
    return 100;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.separatorColor = [UIColor darkGrayColor];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [segue.destinationViewController connectWithSegue:segue object:[self.presenter itemAtIndexPath:self.selectedIndexPath]];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedIndexPath = indexPath;
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    //[self openGalleryDetail:[self.presenter itemAtIndexPath:indexPath]];
    [self performSegueWithIdentifier:@"GalleryDetailSegue" sender:self];
    
}


@end
