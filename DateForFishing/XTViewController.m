//
//  XTViewController.m
//  DateForFishing
//
//  Created by ZhengXiangteng on 16/9/8.
//  Copyright © 2016年 前辈丶. All rights reserved.
//

#import "XTViewController.h"
#import "XTCollectionController.h"
#import "XTPublishViewController.h"

@interface XTViewController ()<UITableViewDelegate,UITableViewDataSource>
/** <#注释#> */
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation XTViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    self.fd_prefersNavigationBarHidden = YES;
    
    [self initTableView];
}

- (void)initTableView{
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Main_WIDTH, Main_HEIGHT ) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.tableHeaderView = [self setupTabeleHeaderView];
    [self.view addSubview:self.tableView];
}

- (UIView *)setupTabeleHeaderView{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_WIDTH, 200)];
    view.backgroundColor = RED;
    
    UIImageView *imgView = [[UIImageView alloc]init];
    imgView.image = [UIImage imageNamed:@"0"];
    [view addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(view);
        make.centerY.equalTo(view);
        make.height.width.equalTo(60);
    }];
    imgView.layer.cornerRadius = 30;
    imgView.layer.masksToBounds = YES;
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"可可";
    label.textColor = [UIColor whiteColor];
    [view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imgView.bottom).offset(10);
        make.centerX.equalTo(view);
    }];
    
    //设置按钮
    UIButton *setBtn = [self setButtonWith:[UIImage imageNamed:@"设置"]];
//    [setBtn addTarget: self action:@selector(toSetPage) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:setBtn];
    

    
    return view;
    
}
//封装设置
- (UIButton *)setButtonWith:(UIImage *)image{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 60, 60);
    
    UIImageView *imgView = [[UIImageView alloc]init];
    imgView.frame = CGRectMake(0, 0, 20, 20);
    imgView.center = CGPointMake(button.frame.size.width/2, button.frame.size.width/2);
    imgView.image = image;
    [button addSubview:imgView];
    
    return button;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.section == 0 && indexPath.row == 0) {
        [self setCellForImage:@"收藏" TextForLift:@"收藏" Cell:cell];
    }else if (indexPath.section == 0 && indexPath.row == 1) {
        [self setCellForImage:@"联系我们" TextForLift:@"联系我们" Cell:cell];
    }else if (indexPath.section == 1 && indexPath.row == 0) {
        [self setCellForImage:@"发布(1)" TextForLift:@"我的发布" Cell:cell];
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // 不加此句时，在二级栏目点击返回时，此行会由选中状态慢慢变成非选中状态。
    // 加上此句，返回时直接就是非选中状态。
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    if (indexPath.section == 0 && indexPath.row == 0) {

        [self.navigationController pushViewController:[XTCollectionController new] animated:YES];
    
    }else if (indexPath.section == 0 && indexPath.row == 1) {

        
        UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"发送邮件" message:@"service@fami2u.com" preferredStyle:1];
        
        UIAlertAction *Action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

        }];
        
        UIAlertAction *Action2 = [UIAlertAction actionWithTitle:@"发送" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

        }];
        
        [vc addAction:Action1];
        [vc addAction:Action2];
        
        [self presentViewController:vc animated:YES completion:nil];
        
    }else if (indexPath.section == 1 && indexPath.row == 0) {
        [self.navigationController pushViewController:[XTPublishViewController new] animated:YES];

    }
    
    
    
    
}



- (UIView *)setCellForImage:(NSString *)image TextForLift:(NSString *)liftText Cell:(UITableViewCell *)cell{
    
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    imgView.center = CGPointMake(25, cell.frame.size.height/2);
    imgView.image = [UIImage imageNamed:image];
    [cell addSubview:imgView];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 110, 20)];
    label.center = CGPointMake(100, cell.frame.size.height/2);
    label.text = liftText;
    [cell addSubview:label];
    
    return cell;
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
