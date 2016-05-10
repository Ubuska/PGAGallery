//
//  PGABaseTableViewController.m
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "PGABaseTableViewController.h"
#import "UIViewController+Styling.h"
#import "PGAPresenterChangeReload.h"
#import "PGAViewCell.h"

const CGFloat kDynamicRowHeight = -1;

@interface PGABaseTableViewController () <PGAPresenterListenerProtocol>
@property (nonatomic, strong, readwrite) NSMutableDictionary* prototypes;
@end

@implementation PGABaseTableViewController

#pragma mark - Styling
+ (BOOL)hasStylingApplied
{
    return YES;
}

#pragma mark - Initialization
- (instancetype)initWithPresenter:(id<PGACollectionPresenterProtocol>)presenter
{
    self = [super init];
    if (self)
    {
        _presenter = presenter;
        _presenter.listener = self;
    }
    return self;
}


#pragma mark - Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self applyStyling];
}

- (void)handleChange:(id<PGAPresenterChangeProtocol>)change
{
    if (self.isViewLoaded)
    {
        [change updateTableView:self.tableView withAnimation:UITableViewRowAnimationFade];
    }
}



#pragma mark - Setters/Getters
- (void)setPresenter:(id<PGACollectionPresenterProtocol>)presenter
{
    _presenter = presenter;
    if (self.isViewLoaded)
        [self.tableView reloadData];
}


#pragma mark - Public methods

- (void)configureCell:(UITableViewCell<PGAViewCell> *)cell
              forItem:(id<PGABaseItemProtocol>)item
      isPrototypeCell:(BOOL)prototype
{
    [self configureCell:cell forItem:item];
}
- (void)configureCell:(UITableViewCell<PGAViewCell>*)cell
              forItem:(id<PGABaseItemProtocol>)item
{
    cell.item = item;
}

- (CGFloat)rowHeightForItem:(id<PGABaseItemProtocol>)item
{
    return self.tableView.rowHeight;
}

- (CGFloat)rowMaxHeightForItem:(id)item
{
    return CGFLOAT_MAX;
}

- (NSMutableDictionary *)prototypes
{
    if (!_prototypes)
    {
        _prototypes = [@{} mutableCopy];
    }
    return _prototypes;
}


#pragma mark - public methods
- (UINib*)registerNibForClass:(Class)cellClass
{
    return [self registerNibForClass:cellClass forReuseIdentifier:NSStringFromClass(cellClass)];
}
- (UINib *)registerNibForClass:(Class)cellClass
            forReuseIdentifier:(NSString *)reuseIdentifier
{
    return [self registerNibForClass:cellClass
                  forReuseIdentifier:reuseIdentifier
                             nibName:NSStringFromClass(cellClass)];
}
- (UINib*)registerNibForClass:(Class)cellClass
           forReuseIdentifier:(NSString*)reuseIdentifier
                      nibName:(NSString *)nibName
{
    if (!reuseIdentifier || reuseIdentifier.length == 0)
    {
        return nil;
    }
    for (NSBundle* bundle in [NSBundle workBundles])
    {
        if ([bundle hasNibWithName:nibName])
        {
            UINib* nib = [UINib nibWithNibName:nibName bundle:bundle];
            [self.tableView registerNib:nib forCellReuseIdentifier:reuseIdentifier];
            [self.prototypes setObject:[nib instantiateWithOwner:nil options:nil].firstObject forKey:reuseIdentifier];
            return nib;
        }
    }
    return nil;
}


#pragma mark - UITableViewDataSource cells
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.presenter numberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [self.presenter numberOfItemsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<PGABaseItemProtocol> item = [self.presenter itemAtIndexPath:indexPath];
    NSString *reuseIdentifier = [item reuseIdentifier];
    UITableViewCell<PGAViewCell>* cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) cell = [self.prototypes objectForKey:[item reuseIdentifier]];
    [self configureCell:cell forItem:item isPrototypeCell:NO];
    return cell;
}

-    (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<PGABaseItemProtocol> item = [self.presenter itemAtIndexPath:indexPath];
    CGFloat height = [self rowHeightForItem:item];
    
    if (height == kDynamicRowHeight)
    {
        NSString *reuseIdentifier = item.reuseIdentifier;
        UITableViewCell<PGAViewCell>* cell = self.prototypes[reuseIdentifier];
        BOOL isPrototype = !!cell;
        if (!cell)
        {
            cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
        }
        [self configureCell:cell forItem:item isPrototypeCell:isPrototype];
        height = [cell systemCompressedHeightInTableView:tableView];
    }
    return MIN(height, [self rowMaxHeightForItem:item]);
}


-       (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.presenter respondsToSelector:@selector(didSelectItemAtIndexPath:completion:)])
    {
        [self.presenter didSelectItemAtIndexPath:indexPath completion:^
        {
            [tableView deselectAllRowsAnimated:YES];
        }];
    }
    if ([self.presenter respondsToSelector:@selector(didSelectItemAtIndexPath:completionResult:)])
    {
        [self.presenter didSelectItemAtIndexPath:indexPath completionResult:^(NSString *segueIdentifier, id sender)
        {
            if(segueIdentifier.length)
            {
                [self performSegueWithIdentifier:segueIdentifier sender:sender ? : self];
            }
        }];
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.presenter respondsToSelector:@selector(canEditItemAtIndexPath:)])
    {
        return [self.presenter canEditItemAtIndexPath:indexPath];
    }
    return NO;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (editingStyle)
    {
        case UITableViewCellEditingStyleDelete:
            if ([self.presenter respondsToSelector:@selector(commitDeleteForRowAtIndexPath:)])
            {
                [self.presenter commitDeleteForRowAtIndexPath:indexPath];
            }
            break;
        default:
            break;
    }
}

#pragma mark - PresenterListener methods

- (void)presenterStateChanged
{
    [self handleChange:[[PGAPresenterChangeReload alloc] init]];
}

@end
