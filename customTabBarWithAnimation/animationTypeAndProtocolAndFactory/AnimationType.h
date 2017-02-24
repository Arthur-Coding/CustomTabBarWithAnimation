//
//  AnimationType.h
//
//  Created by ArthurShuai on 16/5/25.
//  Copyright © 2016年 ArthurShuai. All rights reserved.
//  动画类型设定

#ifndef TabBarAnimation_AnimationType_h
#define TabBarAnimation_AnimationType_h

typedef NS_ENUM(NSInteger, AnimationType){
    FumeAnimationType  =  0,//冒烟,默认类型
    BounceAnimationType,//弹跳
    RotationAnimationType,//旋转
    FrameAnimationType,//帧动画,需添加图片数组
    TransitionAnimationType,//渐变
};

#endif
