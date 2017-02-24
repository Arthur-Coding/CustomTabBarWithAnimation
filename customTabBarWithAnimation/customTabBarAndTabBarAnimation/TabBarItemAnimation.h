//
//  TabBarItemAnimation.h
//
//  Created by ArthurShuai on 16/5/25.
//  Copyright © 2016年 ArthurShuai. All rights reserved.
//  tabbar动画设置类

#import <Foundation/Foundation.h>
#import "TabBarAnimationProtocol.h"

@interface TabBarItemAnimation : NSObject<TabBarAnimationProtocol>

@property (nonatomic, assign) CGFloat duration;//设定动画时长
@property (nonatomic, strong) UIColor *textSelectedColor;//设定item标题文本选中时的颜色
@property (nonatomic, strong) UIColor *iconSelectedColor;//设定item图标选中时的填充颜色
@property (nonatomic, strong) UIColor *defaultColor;//设置item标题文本/图标默认颜色(即未选中时)

@end
