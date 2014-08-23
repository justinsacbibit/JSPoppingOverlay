//
//  JSPoppingOverlay.m
//  Popping Overlay
//
//  Created by Justin Sacbibit on 2014-08-23.
//  Copyright (c) 2014 Justin Sacbibit. All rights reserved.
//

#import "JSPoppingOverlay.h"

@interface JSPoppingOverlay ()

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIView *backgroundOverlayView;
@property (nonatomic, strong) UIImageView *poppingImageView;
@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation JSPoppingOverlay

- (id)init
{
    return self = [self initWithFrame:CGRectZero];
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        _backgroundOverlayView = [[UIView alloc] init];
        _backgroundOverlayView.backgroundColor = [UIColor blackColor];
        _backgroundOverlayView.alpha = 0.75f;
        [self addSubview:_backgroundOverlayView];
        
        _containerView = [[UIView alloc] init];
        [self addSubview:_containerView];
        
        _poppingImageView = [[UIImageView alloc] init];
        _poppingImageView.contentMode = UIViewContentModeCenter;
        _poppingImageView.backgroundColor = [UIColor clearColor];
        [_containerView addSubview:_poppingImageView];
        
        _textLabel = [[UILabel alloc] init];
        _textLabel.textColor = [UIColor whiteColor];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.numberOfLines = 1;
        _textLabel.text = @"YOLO";
        _textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14.0f];
        [_containerView addSubview:_textLabel];
        
        self.layer.masksToBounds = YES;
        self.clipsToBounds = YES;
        
        _duration = 0.5;
        _animationDuration = 0.2;
    }
    return self;
}

- (BOOL)isVisible
{
    return self.superview != nil;
}

- (void)showImage:(UIImage *)image onView:(UIView *)view message:(NSString *)message
{
    if (!view || !((image || self.customImage) || message))
    {
        NSAssert(view, @"%@: %s: Attempt to be shown without a view", [self class], __PRETTY_FUNCTION__);
        NSAssert(image || message, @"%@: %s: Attempt to be shown without content", [self class], __PRETTY_FUNCTION__);
        return;
    }
    
    self.frame = view.bounds;
    
    __block CGRect frame;
    frame.origin.x = 0.0f;
    frame.origin.y = 0.0f;
    frame.size.width = CGRectGetWidth(self.bounds);
    frame.size.height = CGRectGetHeight(self.bounds);
    self.backgroundOverlayView.frame = frame;
    
    self.poppingImageView.image = image;
    frame.size.height = self.poppingImageView.image.size.height;
    self.poppingImageView.frame = frame;
    CGFloat scale = 1.8f;
    self.poppingImageView.transform = CGAffineTransformMakeScale(scale, scale);
    
    CGFloat topPadding = (message && image) ? 10.0f : 0.0f;
    frame.origin.y = CGRectGetMaxY(frame) + topPadding;
    frame.size.height = message ? [message sizeWithAttributes:@{ NSFontAttributeName: self.textLabel.font }].height : 0.0f;
    self.textLabel.frame = message ? frame : CGRectZero;
    self.textLabel.text = message;
    
    frame.size.height = CGRectGetHeight(self.poppingImageView.bounds) + topPadding + CGRectGetHeight(self.textLabel.bounds);
    frame.origin.y = roundf((CGRectGetHeight(self.bounds) - frame.size.height) / 2.0f);
    self.containerView.frame = frame;
    
    [view addSubview:self];
    
    [UIView animateWithDuration:self.animationDuration delay:0.0 usingSpringWithDamping:0.5f initialSpringVelocity:0.2f options:UIViewAnimationOptionCurveLinear animations:^{
        self.poppingImageView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:self.animationDuration delay:self.duration options:UIViewAnimationOptionCurveLinear animations:^{
            self.backgroundOverlayView.alpha = 0.0f;
            self.poppingImageView.alpha = 0.0f;
            self.poppingImageView.transform = CGAffineTransformMakeScale(0.2f, 0.2f);
            frame.origin.y = CGRectGetMaxY(self.bounds);
            self.textLabel.frame = frame;
            self.textLabel.alpha = 0.0f;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }];
}

- (void)showSuccessOnView:(UIView *)view message:(NSString *)message
{
    [self showImage:[self successImage] onView:view message:message];
}

- (void)showErrorOnView:(UIView *)view message:(NSString *)message
{
    [self showImage:[self errorImage] onView:view message:message];
}

#pragma mark - Properties

- (UIImage *)successImage
{
    if (_successImage)
    {
        return _successImage;
    }
    
    return [UIImage imageNamed:@"success"];
}

- (UIImage *)errorImage
{
    if (_errorImage)
    {
        return _errorImage;
    }
    
    return [UIImage imageNamed:@"error"];
}

@end
