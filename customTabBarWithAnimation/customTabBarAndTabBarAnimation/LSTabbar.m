//
//  LSTabbar.m
//
//  Created by ArthurShuai on 16/5/25.
//  Copyright © 2016年 ArthurShuai. All rights reserved.
//

#import "LSTabbar.h"
#import "TabBarItemAnimation.h"
#import "AnimationFactory.h"

@interface LSTabbar()

@end

@implementation LSTabbar

-(void)playAnimation:(UIImageView *)icon textLabel:(UILabel *)textLabel{
    if (_setCustomColor){
        _animation.textSelectedColor = _setCustomColor()[1];
        _animation.iconSelectedColor = _setCustomColor()[2];
    }
    assert(_animation !=nil);
    [_animation playAnimation:icon textLabel:textLabel];
}

-(void)deselectAnimation:(UIImageView *)icon textLabel:(UILabel *)textLabel{
    if (_setCustomColor) _animation.defaultColor = _setCustomColor()[0];
    assert(_animation !=nil);
    [_animation deselectAnimation:icon textLabel:textLabel];
}

-(void)selectedState:(UIImageView *)icon textLabel:(UILabel *)textLabel{
    
    assert(_animation !=nil );
    [_animation selectedState:icon textLabel:textLabel];
}


@end













