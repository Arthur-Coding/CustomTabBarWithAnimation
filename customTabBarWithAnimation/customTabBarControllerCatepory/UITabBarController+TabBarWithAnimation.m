//
//  UITabBarController+TabBarWithAnimation.m
//
//  Created by ArthurShuai on 16/5/25.
//  Copyright © 2016年 ArthurShuai. All rights reserved.
//

#import "UITabBarController+TabBarWithAnimation.h"
#import "LSTabbar.h"
#import "Masonry.h"

#define ImageViewTag 100//item图标tag
#define LabelTag 101//item文本标签tag
#define ScreenW [UIScreen mainScreen].bounds.size.width
@implementation UITabBarController (TabBarWithAnimation)
static NSMutableArray *itemsArr;
static NSArray *colorArray;
#pragma mark 设置启动的item和对应的视图控制器
- (void)setupStartViewControllerAndFirstSelectedItemAtIndex:(NSInteger)index{
    self.selectedIndex = index;
    //设置初始选中的item
    LSTabbar *item = (LSTabbar *)self.tabBar.items[index];
    UIView *container = (UIView *)[self.tabBar viewWithTag:index+1];
    UIImageView *imageView = (UIImageView *)[container viewWithTag:ImageViewTag];;
    UILabel *label = (UILabel *)[container viewWithTag:LabelTag];
    [item playAnimation:imageView textLabel:label];
}
#pragma mark 初始化创建所有的子控制器 和 所有对应的item
- (void)setupChildViewControllersWithVCStoryID:(NSArray *)IDArray andItemTitleName:(NSArray *)titleArray andItemIcon:(NSArray *)iconsArray andItemAnimations:(NSArray *)animationsArray{
    //创建视图控制器
    NSMutableArray *viewControllersArray = [NSMutableArray array];
    for (int i = 0; i < IDArray.count; i++) {
        UIViewController *childVC = [self setupOneChildViewControllerID:IDArray[i] andItemTitle:titleArray[i] andItemImage:iconsArray[i] andAnimationType:[animationsArray[i] integerValue]];
        [viewControllersArray addObject:childVC];
    }
    self.viewControllers = viewControllersArray;
    //创建items
    [self createCustomItems];
}
//设置每一个视图控制器
- (UIViewController *)setupOneChildViewControllerID:(NSString *)vcId andItemTitle:(NSString *)title andItemImage:(NSString *)image andAnimationType:(AnimationType)type
{
    UIViewController *VC = [self.storyboard instantiateViewControllerWithIdentifier:vcId];
    
    LSTabbar *animatedTb = [[LSTabbar alloc] init];
    animatedTb.animation = [AnimationFactory animationWithType:type];
    animatedTb.title = title;
    animatedTb.image = [UIImage imageNamed:image];
    VC.tabBarItem = animatedTb;
    return VC;
}

#pragma mark 初始化所有tabbaritem,及其图片和label
- (void)createCustomItems
{
    __weak typeof(self) weakSelf = self;
    CGFloat width = ScreenW/self.tabBar.items.count;
    [self.tabBar.items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        LSTabbar *tabBarItem = obj;
        tabBarItem.setCustomColor = ^NSArray *{return colorArray;};
        
        UIView *container = [[UIView alloc] initWithFrame:CGRectMake(idx*width, 1, width, 48)];
        container.tag = idx+1;
        [weakSelf.tabBar addSubview:container];
        //添加点击手势
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:weakSelf action:@selector(tapAction:)];
        [container addGestureRecognizer:tapGesture];
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:tabBarItem.image];
        imageView.tag = ImageViewTag;
        imageView.translatesAutoresizingMaskIntoConstraints = NO;
        [container addSubview:imageView];
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(tabBarItem.image.size);
            make.centerY.mas_equalTo(container).offset(-5);
            make.centerX.mas_equalTo(container);
        }];
        
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:10];
        label.textAlignment = NSTextAlignmentCenter;
        label.tag = LabelTag;
        label.text = tabBarItem.title;
        label.translatesAutoresizingMaskIntoConstraints = NO;
        [container addSubview:label];
        
        CGFloat width = weakSelf.tabBar.frame.size.width / weakSelf.tabBar.items.count;
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(width, 10));
            make.centerY.mas_equalTo(container).offset(16);
            make.centerX.mas_equalTo(container);
        }];

        //将所有的item的子视图设为未选中
        [tabBarItem deselectAnimation:imageView textLabel:label];
        
        // 去除原有设置
        tabBarItem.title = nil;
        tabBarItem.image = nil;
    }];
    //将UIView提到前面,不然手势响应会被阻断
    [self.tabBar.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.tag > 0) [weakSelf.tabBar bringSubviewToFront:obj];
    }];
}
//item点击切换操作
- (void)tapAction:(UITapGestureRecognizer *)gesture
{
    NSInteger currentIndex = gesture.view.tag-1;
    if (self.selectedIndex != currentIndex){
        // 现在选中
        LSTabbar *item = (LSTabbar *)self.tabBar.items[currentIndex];
        UIView *container = (UIView *)[self.tabBar viewWithTag:currentIndex+1];
        UIImageView *imageView = (UIImageView *)[container viewWithTag:ImageViewTag];;
        UILabel *label = (UILabel *)[container viewWithTag:LabelTag];
        [item playAnimation:imageView textLabel:label];
        
        // 之前选中
        item = (LSTabbar *)self.tabBar.items[self.selectedIndex];
        container = (UIView *)[self.tabBar viewWithTag:self.selectedIndex+1];
        imageView = (UIImageView *)[container viewWithTag:ImageViewTag];;
        label = (UILabel *)[container viewWithTag:LabelTag];
        [item deselectAnimation:imageView textLabel:label];
        
        self.selectedIndex = currentIndex;
    }
}
#pragma mark 设置自定义颜色
- (void)setupDeselectItemTintColor:(UIColor *)deselectColor andSelectedTextColor:(UIColor *)selectedTextColor andSelectIconColor:(UIColor *)selectedIconColor{
    colorArray = @[deselectColor,selectedTextColor,selectedIconColor];
}

@end
