//
//  UIViewController+PGAController.h
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (PGAController)

// Transitions
- (void)openGalleryDetail:(id)object;


- (void)connectWithSegue:(UIStoryboardSegue*)segue
                  object:(id)object;

- (UIViewController*)loadControllerWithPushSegueIdentifier:(NSString*)pushSegueIdentifier
                                                    object:(id)object;
@end

@interface UIStoryboardSegue (Connections)

- (void)performWithConnection;

@end
