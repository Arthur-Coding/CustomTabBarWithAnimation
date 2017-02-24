//
//  AnimationFactory.h
//
//  Created by ArthurShuai on 16/5/25.
//  Copyright © 2016年 ArthurShuai. All rights reserved.
//  动画生成工厂

#import <Foundation/Foundation.h>
#import "AnimationType.h"

@class TabBarItemAnimation;

@interface AnimationFactory : NSObject

+ (TabBarItemAnimation *)animationWithType:(AnimationType)type;

@end
