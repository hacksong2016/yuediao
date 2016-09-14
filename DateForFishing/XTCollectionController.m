//
//  XTCollectionController.m
//  DateForFishing
//
//  Created by ZhengXiangteng on 16/9/8.
//  Copyright © 2016年 前辈丶. All rights reserved.
//

#import "XTCollectionController.h"
#import "XTFirstCell.h"
#import "XTSingleController.h"

@interface XTCollectionController ()<UITableViewDelegate,UITableViewDataSource>
/** <#注释#> */
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation XTCollectionController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"收藏";
    
    [self initTableView];
    
}

- (void)initTableView{
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Main_WIDTH, Main_HEIGHT+44) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([XTFirstCell class]) bundle:nil] forCellReuseIdentifier:@"XTFirstCell"];
    
    
    [self.view addSubview:self.tableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 230;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    XTFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XTFirstCell" forIndexPath:indexPath];
    
    
    NSArray *arr = @[@"http://pic27.nipic.com/20130130/1589506_102912542128_2.jpg",@"http://www.visit-thai.com/files/2013-11/20131129160228176182.jpg",@"http://file20.mafengwo.net/M00/C6/48/wKgB3FDMV0WAMpz9AAzsOHoFw8026.jpeg",@"http://file20.mafengwo.net/M00/D2/76/wKgB3FC1ZUKAF2ezAApdX0jjLFo66.jpeg"];
    NSArray *name = @[@"渔山列岛激情爆钓3天2夜",@"渔山列岛激情爆钓3天2夜",@"渔山列岛激情爆钓3天2夜",@"渔山列岛激情爆钓3天2夜"];
    
    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:arr[indexPath.row]] placeholderImage:[UIImage imageNamed:@"1470020274400339"]];
    cell.name = name[indexPath.row];
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    [self.navigationController pushViewController:[XTSingleController new] animated:YES];
    
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
