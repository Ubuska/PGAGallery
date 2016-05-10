//
//  PGAUtils.m
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "PGAUtils.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

static NSArray* _kAdditionalBundles = nil;
@implementation NSBundle (IDUtils)

+ (NSArray *)workBundles
{
    NSArray* bundles = @[[NSBundle mainBundle]];
    NSArray* otherBundles = [NSBundle additionalBundles];
    if (otherBundles.count > 0)
    {
        bundles = [bundles arrayByAddingObjectsFromArray:otherBundles];
    }
    return bundles;
}
+ (NSArray *)additionalBundles
{
    return _kAdditionalBundles;
}
- (BOOL)hasNibWithName:(NSString*)name
{
    if (!name)
    {
        return NO;
    }
    NSString* path = [self pathForResource:name ofType:@"nib"];
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}
- (BOOL)hasStoryboardWithName:(NSString*)name
{
    if (!name)
    {
        return NO;
    }
    NSString* path = [self pathForResource:name ofType:@"storyboardc"];
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}

@end

@implementation Utils

+ (CGFloat)screenHeight
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    return screenRect.size.height;
}
+ (CGFloat)screenWidth
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    return screenRect.size.width;
}

@end

@implementation NSObject (PGAUtils)

+ (NSString*)className
{
    return NSStringFromClass([self class]);
}

- (NSString*)className
{
    return [[self class] className];
}


@end

@implementation NSMutableArray (PGAUtils)

- (void)addObjectSafety:(id)anObject
{
    if (anObject)
    {
        [self addObject:anObject];
    }
}

@end

@implementation NSArray (IDUtils)

- (NSArray*)mapLike:(id(^)(id))mapBlock
{
    if (!mapBlock)
        return nil;
    NSMutableArray* mapped = [@[] mutableCopy];
    for (id obj in self)
    {
        [mapped addObjectSafety:mapBlock(obj)];
    }
    return mapped;
}

- (id)safeObjectAtIndex:(NSInteger)index
{
    if(index < self.count)
    {
        return [self objectAtIndex:index];
    }
    else
    {
        return nil;
    }
}
@end


@implementation UITableViewCell (PGAUtils)

- (CGFloat)systemCompressedHeightInTableView:(UITableView*)tableView
{
    self.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.frame), CGRectGetHeight(self.bounds));
    [self layoutIfNeeded];
    return [self.contentView systemCompressedHeight];
}
@end


@implementation UIView (PGAUtils)

- (void)addSubview:(UIView *)view withAutoLayoutMargin:(CGFloat)margin
{
    view.translatesAutoresizingMaskIntoConstraints = NO;
    return [self addSubview:view withAutoLayoutEdgeMargin:UIEdgeInsetsMake(margin, margin, margin, margin)];
}

- (void)addSubview:(UIView *)view withAutoLayoutEdgeMargin:(UIEdgeInsets)marginEdge
{
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:view];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual
                                                        toItem:self attribute:NSLayoutAttributeLeading multiplier:1 constant:marginEdge.left]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual
                                                        toItem:view attribute:NSLayoutAttributeTrailing multiplier:1 constant:marginEdge.right]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
                                                        toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:marginEdge.top]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual
                                                        toItem:view attribute:NSLayoutAttributeBottom multiplier:1 constant:marginEdge.bottom]];
}

+ (NSArray *)objectsFromNibWithOwner:(id)owner
{
    return [[NSBundle mainBundle] loadNibNamed:[self className] owner:owner options:nil];
}

+ (id)loadFromNib
{
    return [self objectsFromNibWithOwner:nil].firstObject;
}
+ (id)loadFromNibWithOwner:(id)owner
{
    return [self objectsFromNibWithOwner:owner].firstObject;
}

- (CGFloat)systemCompressedHeight
{
    return ceil([self systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height) + 1;
}



- (CGFloat)x
{
    return self.frame.origin.x;
}
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
- (CGFloat)y
{
    return self.frame.origin.y;
}
- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (CGFloat)width
{
    return self.frame.size.width;
}
- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
- (CGFloat)height
{
    return self.frame.size.height;
}
- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

@end

@implementation UITableView (PGAUtils)

- (void)deselectAllRowsAnimated:(BOOL)animated
{
    NSArray* sel = self.indexPathsForSelectedRows;
    for (NSIndexPath* ip in sel)
    {
        [self deselectRowAtIndexPath:ip animated:animated];
    }
}

@end

@implementation UIImage (PGAUtils)

+ (void)loadImageDataWithURLString:(NSString *)urlString andBlock:(void (^)(NSData *imageData))processImage
{
    NSURL *url = [NSURL URLWithString:urlString];
    
    dispatch_queue_t callerQueue = dispatch_get_current_queue();
    dispatch_queue_t downloadQueue = dispatch_queue_create("com.myapp.processsmagequeue", NULL);
    dispatch_async(downloadQueue, ^{
        NSData * imageData = [NSData dataWithContentsOfURL:url];
        
        dispatch_async(callerQueue, ^{
            processImage(imageData);
        });
    });
}

-(UIImage *)scaleImageToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end

#define KBFloatColor(x) ((x & 0xFF) / 255.0f)

@implementation UIColor (IDUtils)

+ (UIColor *)colorWithHex:(uint)hex
{
    CGFloat red = KBFloatColor(hex >> 16);
    CGFloat green = KBFloatColor(hex >> 8);
    CGFloat blue = KBFloatColor(hex);
    return [UIColor colorWithRed:red green:green blue:blue alpha:1];
}

+ (UIColor *)colorWithHexString:(NSString *)hex
{
    if (!hex)
        return nil;
    uint hexColor = 0;
    NSScanner* scanner = [NSScanner scannerWithString:hex];
    [scanner scanCharactersFromSet:[NSCharacterSet characterSetWithCharactersInString:@"#"]
                        intoString:nil];
    [scanner scanHexInt:&hexColor];
    return [UIColor colorWithHex:hexColor];
}

@end
