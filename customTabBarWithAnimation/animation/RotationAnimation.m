//
//  RotationAnimation.m
//
//  Created by ArthurShuai on 16/5/25.
//  Copyright © 2016年 ArthurShuai. All rights reserved.
//

#import "RotationAnimation.h"

@implementation RotationAnimation

- (void)playAnimation:(UIImageView *)icon textLabel:(UILabel *)textLabel
{
    [self playRotaionAnimation:icon];
    
    textLabel.textColor = self.textSelectedColor;
    
    UIImage *renderImage = [icon.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    icon.image = renderImage;
    
    icon.tintColor = self.iconSelectedColor;
}

- (void)deselectAnimation:(UIImageView *)icon textLabel:(UILabel *)textLabel
{
    textLabel.textColor = self.defaultColor;
    
    UIImage *renderImage = [icon.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    icon.image = renderImage;
    
    icon.tintColor = self.defaultColor;
}

- (void)selectedState:(UIImageView *)icon textLabel:(UILabel *)textLabel
{
    textLabel.textColor = self.textSelectedColor;
    
    UIImage *renderImage = [icon.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    icon.image = renderImage;
    
    icon.tintColor = self.iconSelectedColor;
}

- (void)playRotaionAnimation:(UIImageView *)icon
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    
    animation.values = @[@(0), @(M_PI_2), @(M_PI), @(M_PI * 2)];
    animation.duration = self.duration;
    animation.calculationMode = kCAAnimationCubic;
    
    [icon.layer addAnimation:animation forKey:@"playRotaionAnimation"];
}

@end
