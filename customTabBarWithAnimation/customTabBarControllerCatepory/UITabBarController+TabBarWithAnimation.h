//
//  UITabBarController+TabBarWithAnimation.h
//
//  Created by ArthurShuai on 16/5/25.
//  Copyright © 2016年 ArthurShuai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimationFactory.h"

@interface UITabBarController (TabBarWithAnimation)
/*
设置子视图控制器及对应的tabBarItem
//第一个参数是视图控制器在storyboard中的ID数组
//第二个参数是每一个视图控制器对应的tabBarItem的文本标题数组
//第三个参数是每一个视图控制器对应的tabBarItem的图标数组
//第四个参数是每一个视图控制器对应的tabBarItem的动画类型数组(必须封装装入)
    // 
       FumeAnimationType  =  0,//冒烟,默认类型
       BounceAnimationType,//弹跳
       RotationAnimationType,//旋转
       FrameAnimationType,//帧动画,需添加图片数组
       TransitionAnimationType,//渐变
    //
 */
- (void)setupChildViewControllersWithVCStoryID:(NSArray *)IDArray andItemTitleName:(NSArray *)titleArray andItemIcon:(NSArray *)iconsArray andItemAnimations:(NSArray *)animationsArray;

/*
 设置启动的tabBarItem和对应的视图控制器
//只需要传入一个对应位置的索引即可
 */
- (void)setupStartViewControllerAndFirstSelectedItemAtIndex:(NSInteger)index;

/*
 设置tabBarItem的未被选中时的填充颜色,以及选中时的文本标题颜色与图标颜色
//第一个参数是tabBarItem未被选中时的填充颜色
//第二个参数是tabBarItem选中时的文本标题颜色
//第三个参数是tabBarItem选中时的图标颜色
 */
- (void)setupDeselectItemTintColor:(UIColor *)deselectColor andSelectedTextColor:(UIColor *)selectedTextColor andSelectIconColor:(UIColor *)selectedIconColor;

@end
