JSPoppingOverlay
================

Simple subclass of UIView for displaying a quick event feedback to a user.

![GIF](http://i.imgur.com/tJ2KEkV.gif)

Installation
-

###Manually

- Drag the `Popping Overlay/JSPoppingOverlay` folder into your project.

###Cocoapods

- There is currently no support for Cocoapods. If you really want it, please make a feature request by creating an issue with the `feature request` label.

Usage
-

You can see the sample XCode project in `Demo/`

#####Important: Success/error images are not included in the `JSPoppingOverlay` folder.

You can use the provided JSPoppingOverlay category on UIView:
```objective-c
[self.viewToShowOverlayOn showSuccessPoppingOverlayWithMessage:mySuccessMessage];
```

Or you can create and customize a JSPoppingOverlay object:
```objective-c
JSPoppingOverlay *poppingOverlay = [[JSPoppingOverlay alloc] init];

// customization
poppingOverlay.animationDuration = myAnimationDuration;
poppingOverlay.font = myFont;

[poppingOverlay showSuccessOnView:viewToShowOverlayOn message:mySuccessMessage];
```

Customization
- 

There are multiple properties you can access to customize the appearance of the popping overlay:
```objective-c
@property (nonatomic, strong) UIColor *backgroundOverlayColor;
@property (nonatomic) CGFloat backgroundOverlayAlpha;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIFont  *font;
@property (nonatomic, strong) UIImage *successImage;
@property (nonatomic, strong) UIImage *errorImage;
@property (nonatomic, strong) UIImage *customImage;
@property (nonatomic) NSTimeInterval animationDuration;
@property (nonatomic) NSTimeInterval duration;
```

Issues/Contributions
-

Feel free to submit an issue or a pull request!
