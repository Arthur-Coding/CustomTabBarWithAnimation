//
//  TabBarItemAnimation.m
//
//  Created by ArthurShuai on 16/5/25.
//  Copyright © 2016年 ArthurShuai. All rights reserved.
//

#import "TabBarItemAnimation.h"

@implementation TabBarItemAnimation
- (UIColor *)defaultColor{
    if (_defaultColor == nil) {
        _defaultColor = [UIColor grayColor];
    }
    return _defaultColor;
}
- (UIColor *)textSelectedColor{
    if (_textSelectedColor == nil) {
        _textSelectedColor = [UIColor colorWithRed:0 green:0.478431 blue:1 alpha:1];
    }
    return _textSelectedColor;
}
- (UIColor *)iconSelectedColor{
    if (_iconSelectedColor == nil) {
        _iconSelectedColor = [UIColor colorWithRed:0 green:0.478431 blue:1 alpha:1];
    }
    return _iconSelectedColor;
}
- (CGFloat)duration{
    if (_duration == 0) {
        _duration = 0.2;
    }
    return _duration;
}
#pragma mark 这里不需要执行协议具体实现,但必须遵循协议,故,协议必须实现方法内容设为空
- (void)playAnimation:(UIImageView *)icon textLabel:(UILabel *)textLabel{
}

- (void)deselectAnimation:(UIImageView *)icon textLabel:(UILabel *)textLabel{
}

- (void)selectedState:(UIImageView *)icon textLabel:(UILabel *)textLabel{
}

@end
