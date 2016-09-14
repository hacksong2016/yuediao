//
//  XTNavigationController.m
//  百思不得姐
//
//  Created by ZhengXiangteng on 16/4/7.
//  Copyright © 2016年 前辈丶. All rights reserved.
//

#import "XTNavigationController.h"

@implementation XTNavigationController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationBar setTitleTextAttributes:
     
  @{NSFontAttributeName:[UIFont systemFontOfSize:16],
    
    NSForegroundColorAttributeName:[UIColor blackColor]}];
    
    //    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    
    // 如果滑动移除控制器的功能失效，清空代理(让导航控制器重新设置这个功能)
//    self.interactivePopGestureRecognizer.delegate = nil;
    self.navigationBar.tintColor = [UIColor blackColor];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count > 0) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setTitle:@"返回" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:17];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        button.size = CGSizeMake(50, 30);
        //让按钮内部的所有内容左对齐
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //让按钮的内容往左偏移10
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        // 修改导航栏左边的item
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        
        // 隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    // 这句super的push要放在后面, 让viewController可以覆盖上面设置的leftBarButtonItem
    [super pushViewController:viewController animated:animated];

}

- (void)back{
    


    
    [self popViewControllerAnimated:YES];
}

@end
