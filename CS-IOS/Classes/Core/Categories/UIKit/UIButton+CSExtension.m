//
// Created by inno on 1/28/13.
//
// To change the template use AppCode | Preferences | File Templates.
//
#import "CSLang.h"
#import "UIButton+CSExtension.h"

@implementation UIButton (CSExtension)

- (void)stretchableBackgroundImageWithLeftCapWidth:(NSInteger)leftCapWidth topCapHeight:(NSInteger)topCapHeight {
    [self setBackgroundImage:[[self backgroundImageForState:UIControlStateNormal] stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight] forState:UIControlStateNormal];
    [self setBackgroundImage:[[self backgroundImageForState:UIControlStateSelected] stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight] forState:UIControlStateSelected];
    [self setBackgroundImage:[[self backgroundImageForState:UIControlStateDisabled] stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight] forState:UIControlStateDisabled];
    [self setBackgroundImage:[[self backgroundImageForState:UIControlStateHighlighted] stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight] forState:UIControlStateHighlighted];
}

+ (UIButton *)createWithFrame:(CGRect)rect image:(UIImage *)image contentMode:(UIViewContentMode)mode {
    UIButton *button = [UIButton.alloc initWithFrame:rect];
    button.imageView.contentMode = mode;
    button.picture = image;
    return button;
}

- (void)setTitleColor:(UIColor *)color {
    [self setTitleColor:color forState:UIControlStateNormal];
    [self setTitleColor:color forState:UIControlStateHighlighted];
    [self setTitleColor:color forState:UIControlStateDisabled];
    [self setTitleColor:color forState:UIControlStateSelected];
}

- (instancetype)setTitle:(NSString *)title {
    [self setTitle:title forState:UIControlStateNormal];
    return self;
}

- (NSString *)title {
    return [self titleForState:UIControlStateNormal];
}

- (instancetype)setPicture:(UIImage *)image {
    [self setImage:image forState:UIControlStateNormal];
    return self;
}

- (void)setBackgroundImage:(UIImage *)image {
    [self setBackgroundImage:image forState:UIControlStateNormal];
}
@end
