//
//  BounceAnimation.m
//
//  Created by ArthurShuai on 16/5/25.
//  Copyright © 2016年 ArthurShuai. All rights reserved.
//

#import "BounceAnimation.h"

@implementation BounceAnimation

- (void)playAnimation:(UIImageView *)icon textLabel:(UILabel *)textLabel
{
    [self playBounceAnimation:icon];
    
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

- (void)playBounceAnimation:(UIImageView *)icon
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    
    animation.values = @[@(1), @(1.5), @(0.9), @(0.5), @(0.1), @(1)];
    animation.duration = self.duration;
    animation.calculationMode = kCAAnimationCubic;
    
    [icon.layer addAnimation:animation forKey:@"playBounceAnimation"];
}
@end
