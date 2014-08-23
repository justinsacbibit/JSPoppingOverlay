//
//  ViewController.m
//  Popping Overlay
//
//  Created by Justin Sacbibit on 2014-08-23.
//  Copyright (c) 2014 Justin Sacbibit. All rights reserved.
//

#import "ViewController.h"
#import "UIView+JSPoppingOverlay.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *successView;
@property (nonatomic, strong) UIView *failedView;
@property (nonatomic, strong) UIView *roundView;
@property (nonatomic, strong) UIView *customView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGFloat topMargin = 100.0f;
    CGFloat width = roundf(CGRectGetWidth(self.view.bounds) / 3.0f);
    CGFloat leftMargin = roundf((CGRectGetWidth(self.view.bounds) - 2.0f * width) / 3.0f);
    
    self.successView = [[UIView alloc] initWithFrame:CGRectMake(leftMargin, topMargin, width, width)];
    self.successView.backgroundColor = [UIColor redColor];
    UITapGestureRecognizer *tapSuccess = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showSuccessOverlay)];
    [self.successView addGestureRecognizer:tapSuccess];
    [self.view addSubview:self.successView];
    
    self.failedView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.successView.frame) + leftMargin, topMargin, width, width)];
    self.failedView.backgroundColor = [UIColor blueColor];
    UITapGestureRecognizer *tapFailure = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showFailedOverlay)];
    [self.failedView addGestureRecognizer:tapFailure];
    [self.view addSubview:self.failedView];
    
    topMargin = topMargin - 64.0f;
    leftMargin = roundf((CGRectGetWidth(self.view.bounds) - width) / 2.0f);
    self.roundView = [[UIView alloc] initWithFrame:CGRectMake(leftMargin, CGRectGetMaxY(self.failedView.frame) + topMargin, width, width)];
    self.roundView.backgroundColor = [UIColor yellowColor];
    self.roundView.layer.cornerRadius = roundf(width / 2.0f);
    self.roundView.layer.masksToBounds = YES;
    UITapGestureRecognizer *tapRound = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showRoundOverlay)];
    [self.roundView addGestureRecognizer:tapRound];
    [self.view addSubview:self.roundView];
    
    width = width * 2.0f;
    CGFloat height = width / 1.5f;
    leftMargin = roundf((CGRectGetWidth(self.view.bounds) - width) / 2.0f);
    self.customView = [[UIView alloc] initWithFrame:CGRectMake(leftMargin, CGRectGetMaxY(self.roundView.frame) + topMargin, width, height)];
    self.customView.backgroundColor = UIColor.greenColor;
    UITapGestureRecognizer *tapCustom = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showCustomOverlay)];
    [self.customView addGestureRecognizer:tapCustom];
    [self.view addSubview:self.customView];
    
    UITapGestureRecognizer *tapBackground = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showInitialOverlays)];
    [self.view addGestureRecognizer:tapBackground];
}

- (void)showInitialOverlays
{
    [self showSuccessOverlay];
    [self showFailedOverlay];
    [self showRoundOverlay];
    [self showCustomOverlay];
}

- (void)showSuccessOverlay
{
    [self.successView showSuccessPoppingOverlayWithMessage:@"Success!"];
}

- (void)showFailedOverlay
{
    [self.failedView showErrorPoppingOverlayWithMessage:@"Failed!"];
}

- (void)showRoundOverlay
{
    [self.roundView showSuccessPoppingOverlayWithMessage:@"Round!"];
}

- (void)showCustomOverlay
{
    [self.customView showPoppingOverlayWithImage:[UIImage imageNamed:@"SHIP"] withMessage:@"SHIP IT!"];
}

@end
