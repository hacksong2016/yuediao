//
//  XTFirstController.m
//  DateForFishing
//
//  Created by ZhengXiangteng on 16/9/8.
//  Copyright © 2016年 前辈丶. All rights reserved.
//

#import "XTFirstController.h"
#import "XTFirstCell.h"
#import "XTWebController.h"
#import "XTSingleController.h"

@interface XTFirstController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>

/**  */
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation XTFirstController
- (void)viewDidLoad {
    [super viewDidLoad];


    self.fd_prefersNavigationBarHidden = YES;
    
    [self initTableView];

}

- (void)initTableView{
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Main_WIDTH, Main_HEIGHT+44) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([XTFirstCell class]) bundle:nil] forCellReuseIdentifier:@"XTFirstCell"];
    
    self.tableView.tableHeaderView = [self setupTableHeaderView];
    
    [self.view addSubview:self.tableView];
}

- (UIView *)setupTableHeaderView{
    
    SDCycleScrollView *topView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, Main_WIDTH, 250) delegate:self placeholderImage:nil];
    topView.backgroundColor = [UIColor whiteColor];
    topView.pageControlStyle = SDCycleScrollViewPageContolStyleNone;
    
    
    topView.imageURLStringsGroup = @[@"http://forums-cdn.fami2u.com/uploads/default/original/1X/8187384a9af7b01cfb73619cfbb9f909e3ab3e99.png",@"http://forums-cdn.fami2u.com/uploads/default/original/1X/81010717b1c95d7f1294c0adbb6314a601db5d58.png",@"http://forums-cdn.fami2u.com/uploads/default/original/1X/f60dba67cb6132a2561e5a3230a15863d7eee450.png"];
    
    return topView;
    
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
    
    [self.navigationController pushViewController:[XTWebController new] animated:YES];
    
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

@end
