//
//  TabBarAnimationProtocol.h
//
//  Created by ArthurShuai on 16/5/25.
//  Copyright © 2016年 ArthurShuai. All rights reserved.
//  执行动画协议,方法必须执行,但可执行空内容

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol TabBarAnimationProtocol <NSObject>

- (void)playAnimation:(UIImageView *)icon textLabel:(UILabel *)textLabel;

- (void)deselectAnimation:(UIImageView *)icon textLabel:(UILabel *)textLabel;

- (void)selectedState:(UIImageView *)icon textLabel:(UILabel *)textLabel;

@end
