//
//  LSTabbar.h
//
//  Created by ArthurShuai on 16/5/25.
//  Copyright © 2016年 ArthurShuai. All rights reserved.
//  自定义的tabbar

#import <UIKit/UIKit.h>
#import "TabBarAnimationProtocol.h"

@class TabBarItemAnimation;
@interface LSTabbar : UITabBarItem<TabBarAnimationProtocol>

@property(nonatomic,strong)TabBarItemAnimation *animation;
@property (nonatomic,copy)NSArray *(^setCustomColor)(void);//得到自定义颜色

@end
