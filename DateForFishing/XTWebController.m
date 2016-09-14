//
//  XTWebController.m
//  DateForFishing
//
//  Created by ZhengXiangteng on 16/9/8.
//  Copyright © 2016年 前辈丶. All rights reserved.
//

#import "XTWebController.h"

@interface XTWebController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;


@end

@implementation XTWebController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWebView];

    
    
    self.view.backgroundColor = [UIColor whiteColor];
}


- (void)initWebView{
    
    self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, Main_WIDTH, Main_HEIGHT )];
    self.webView.delegate = self;
    self.webView.backgroundColor = [UIColor whiteColor];
    ;
    NSURL *url = [NSURL URLWithString:@"http://forums.fami2u.com/t/hacksong-2016-9-5-9-12/61"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    [self.view addSubview:self.webView];
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
