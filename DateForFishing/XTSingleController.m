//
//  XTSingleController.m
//  DateForFishing
//
//  Created by ZhengXiangteng on 16/9/8.
//  Copyright © 2016年 前辈丶. All rights reserved.
//

#import "XTSingleController.h"
#import "XTSingleGoodsView.h"
#import "XTChatViewController.h"
#import "CommentsController.h"

@interface XTSingleController ()<XTSingleGoodsViewDelegate>

@end

@implementation XTSingleController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    XTSingleGoodsView *singleGoodsView = [XTSingleGoodsView singleGoodsView];
    singleGoodsView.delegate = self;
    singleGoodsView.topView.delegate = self;
    singleGoodsView.frame = CGRectMake(0, 0, Main_WIDTH, Main_HEIGHT );
    [self.view addSubview:singleGoodsView];

    [self bottomBtn];

}

- (void)bottomBtn{

    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    
    button.frame = CGRectMake(0, Main_HEIGHT - 40, Main_WIDTH, 40);
    
    button.backgroundColor = RED;
    [button setTitle:@"立即预约" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
}

- (void)buttonClick{
    UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"填写信息,付款,预约成功" message:@"" preferredStyle:1];
    
    UIAlertAction *Action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    
    [vc addAction:Action1];
    
    [self presentViewController:vc animated:YES completion:nil];
    

}


- (void)chatWithPerson{
    
    [self.navigationController pushViewController:[XTChatViewController new] animated:YES];
}

- (void)Callup{
    
    NSString *phone = [NSString stringWithFormat:@"tel:1888888888"];
    
    
    UIWebView *webView = [[UIWebView alloc] init];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:phone]]];
    [self.view addSubview:webView];

}
- (void)allComments{
    
    
    [self.navigationController pushViewController:[CommentsController new] animated:YES];
    
    
}


- (void)allDetailed{
    
    

    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"全部描述" message:@"1.相关天气情况参考：舟山气象台、宁波气象台、日本浪区图。\n2.本行程所赠送保险为价值20万，2天成人保险，如需增加购买天数请自行负责多余费用。\n3.雨具等价格包含费用外的物品请自行负责！\n4.本行程全程免费提供导钓、领队服务，船上有冰块、活虾、矿泉水，并赠送户外保险。" preferredStyle:UIAlertControllerStyleAlert];
    
    UIView *subView1 = alertController.view.subviews[0];
    UIView *subView2 = subView1.subviews[0];
    UIView *subView3 = subView2.subviews[0];
    UIView *subView4 = subView3.subviews[0];
    UIView *subView5 = subView4.subviews[0];
    //取title和message：
    UILabel *message1 = subView5.subviews[1];
    //然后设置message内容居左：
    message1.textAlignment = NSTextAlignmentLeft;
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil];
    
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];

    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
