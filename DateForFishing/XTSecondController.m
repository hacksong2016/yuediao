//
//  XTSecondController.m
//  DateForFishing
//
//  Created by ZhengXiangteng on 16/9/8.
//  Copyright © 2016年 前辈丶. All rights reserved.
//

#import "XTSecondController.h"
#import "XTChatTableViewCell.h"
#import "XTChatViewController.h"

@interface XTSecondController ()<UITableViewDelegate,UITableViewDataSource>
/** <#注释#> */
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation XTSecondController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"聊天";

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initTableView];
    
}

- (void)initTableView{
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Main_WIDTH, Main_HEIGHT+44) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([XTChatTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"XTChatTableViewCell"];
    
    
    [self.view addSubview:self.tableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    XTChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XTChatTableViewCell" forIndexPath:indexPath];
    
    
    NSString *str = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    cell.imgView.image = [UIImage imageNamed:str];
 
    
    NSArray *nameArr = @[@"3630俱乐部",@"可可",@"Tom",@"我爱海钓"];
    cell.name.text = nameArr[indexPath.row];
    
    NSArray *titleArr = @[@"谢谢",@"在么?",@"昨天玩的开心么?",@"再见"];
    cell.title.text = titleArr[indexPath.row];
    
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    [self.navigationController pushViewController:[XTChatViewController new] animated:YES];
    
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
