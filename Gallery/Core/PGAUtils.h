//
//  PGAUtils.h
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UITableView.h>
#import <UIKit/UIImage.h>


@interface NSBundle (IDUtils)

+ (NSArray*)workBundles;
+ (NSArray*)additionalBundles;
- (BOOL)hasNibWithName:(NSString*)name;
- (BOOL)hasStoryboardWithName:(NSString*)name;

@end

@interface Utils : NSObject 

+ (CGFloat)screenHeight;
+ (CGFloat)screenWidth;

@end

@interface NSObject (PGAUtils)
+ (NSString*)className;
- (NSString*)className;

@end

@interface NSMutableArray (PGAUtils)

- (void)addObjectSafety:(id)anObject;

@end

@interface NSArray (IDUtils)

- (NSArray *)mapLike:(id(^)(id))mapBlock;
- (id)safeObjectAtIndex:(NSInteger)index;
@end

@interface UITableViewCell (PGAUtils)

- (CGFloat)systemCompressedHeightInTableView:(UITableView*)tableView;

@end

@interface UIView (PGAUtils)

- (void)addSubview:(UIView *)view withAutoLayoutMargin:(CGFloat)margin;
- (void)addSubview:(UIView *)view withAutoLayoutEdgeMargin:(UIEdgeInsets)marginEdge;

+ (id)loadFromNibWithOwner:(id)owner;
+ (id)loadFromNib;

- (CGFloat)systemCompressedHeight;

@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

@end

@interface UITableView (PGAUtils)

- (void)deselectAllRowsAnimated:(BOOL)animated;

@end

@interface UIImage (PGAUtils)

+ (void)loadImageDataWithURLString:(NSString *)urlString andBlock:(void (^)(NSData *imageData))processImage;
-(UIImage *)scaleImageToSize:(CGSize)newSize;

@end

@interface UIColor (IDUtils)

+ (UIColor *)colorWithHex:(uint)hex;
+ (UIColor *)colorWithHexString:(NSString *)hex;

@end