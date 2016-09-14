//
//  XTtabBarController.m
//  DateForFishing
//
//  Created by ZhengXiangteng on 16/9/8.
//  Copyright © 2016年 前辈丶. All rights reserved.
//

#import "XTtabBarController.h"
#import "XTFirstController.h"
#import "XTSecondController.h"
#import "XTThirdViewController.h"
#import "XTViewController.h"
#import "XTNavigationController.h"
@implementation XTtabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //    [UINavigationBar appearance];
    
    // 通过appearance统一设置所有UITabBarItem的文字属性
    // 后面带有UI_APPEARANCE_SELECTOR的方法, 都可以通过appearance对象来统一设置
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    // 添加子控制器
    [self setupChildVc:[[XTFirstController alloc] init] title:@"首页" image:@"发现-未选中" selectedImage:@"发现-选中"];
    
    [self setupChildVc:[[XTSecondController alloc] init] title:@"消息" image:@"消息-未选中" selectedImage:@"消息-选中"];
    
    [self setupChildVc:[[XTThirdViewController alloc] init] title:@"来约" image:@"订单-未选中" selectedImage:@"订单-选中"];
    [self setupChildVc:[[XTViewController alloc] init] title:@"我的" image:@"我的-未选中" selectedImage:@"我的-选中"];
}

/**
 * 初始化子控制器
 */
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置文字和图片
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
//    vc.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(100)/100.0 green:arc4random_uniform(100)/100.0 blue:arc4random_uniform(100)/100.0 alpha:1.0];
    XTNavigationController *navVc = [[XTNavigationController alloc]initWithRootViewController:vc];
    
    // 添加为子控制器
    [self addChildViewController:navVc];
}
@end
