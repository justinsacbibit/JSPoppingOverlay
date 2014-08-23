//
//  JSPoppingOverlay.h
//  Popping Overlay
//
//  Created by Justin Sacbibit on 2014-08-23.
//  Copyright (c) 2014 Justin Sacbibit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSPoppingOverlay : UIView

#pragma mark - Customization
/**
 *  The overlay's background color.
 *  @discussion default is [UIColor blackColor]
 */
@property (nonatomic, strong) UIColor *backgroundOverlayColor;
/**
 *  The color of the message text.
 *  @discussion default is [UIColor whiteColor]
 */
@property (nonatomic, strong) UIColor *textColor;
/**
 *  The font of the message text.
 *  @discussion default is [UIFont fontWithName:@"HelveticaNeue-Light" size:14.0f]
 */
@property (nonatomic, strong) UIFont  *font;
/**
 *  The default success image of the overlay.
 *  @discussion default is currently nil, searches for image named "success"
 */
@property (nonatomic, strong) UIImage *successImage;
/**
 *  The default error image of the overlay.
 *  @discussion default is currently nil, searches for image named "error"
 */
@property (nonatomic, strong) UIImage *errorImage;
/**
 *  The default custom image of the overlay.
 *  @discussion default is nil
 */
@property (nonatomic, strong) UIImage *customImage;
/**
 *  The length of time for the enter and exit animations.
 *  @discussion default is 0.2 seconds
 */
@property (nonatomic) NSTimeInterval animationDuration;
/**
 *  The length of time for the overlay to be displayed.
 *  @discussion default is 0.5 seconds
 */
@property (nonatomic) NSTimeInterval duration;

#pragma mark - Display
/**
 *  Convenience method for checking if the overlay is visible.
 */
- (BOOL)isVisible;
/**
 *  Show the overlay with a message and custom image.
 *  @param image Custom image to be displayed on the overlay. Required to be non-nil if there is no default custom image set.
 *  @param view The view for the overlay to be displayed on. This parameter must not be nil.
 *  @param message The message text to be displayed. This parameter must not be nil.
 */
- (void)showImage:(UIImage *)image onView:(UIView *)view message:(NSString *)message;
/**
 *  Show a success overlay with a message.
 *  @param view The view for the overlay to be displayed on. This parameter must not be nil.
 *  @param message The message text to be displayed. This parameter must not be nil.
 */
- (void)showSuccessOnView:(UIView *)view message:(NSString *)message;
/**
 *  Show a failure overlay with a message.
 *  @param view The view for the overlay to be displayed on. This parameter must not be nil.
 *  @param message The message text to be displayed. This parameter must not be nil.
 */
- (void)showErrorOnView:(UIView *)view message:(NSString *)message;

@end
