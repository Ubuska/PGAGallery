//
//  LinkedStoryboardPushSegue
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LinkedStoryboardPushSegue : UIStoryboardSegue
- (id)initWithIdentifier:(NSString *)identifier source:(UIViewController *)source;
@end
