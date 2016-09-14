//
//  ReadyPbulishController.m
//  PP户外
//
//  Created by dabei on 15/11/18.
//  Copyright © 2015年 bing. All rights reserved.
//

#import "ReadyPbulishController.h"
#import "XTSingleController.h"


@interface ReadyPbulishController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;


@property (nonatomic, strong) NSMutableArray *typeNumMuArr;//记录下面添加内容的状态数组,新建时初始各项为0,修改时根据数据初始各项,顶部进度条根据数组已填项目数显示(注:添加图片为第0项)

@property (nonatomic, strong) UIView *progressView;//顶部的进度条

@property (nonatomic, assign) NSInteger progressNum;

/** 顶部的照片 */
@property (nonatomic , strong) UIImageView *topImgView;

@end

@implementation ReadyPbulishController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BACKGROUNDCOLOR;
   
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"预览" style:UIBarButtonItemStylePlain target:self action:@selector(nextPage)];
    
    
    
    self.typeNumMuArr=[NSMutableArray arrayWithCapacity:0];
    
    for (int i = 0; i < 5; i++) {//状态数组初始赋值
        [self.typeNumMuArr addObject:@"0"];
    }
    
 
    
    
    NSLog(@"--%@",self.typeNumMuArr);
    
    [self.typeNumMuArr replaceObjectAtIndex:2 withObject:@"1"];
    [self.typeNumMuArr replaceObjectAtIndex:0 withObject:@"1"];

    [self drawReadyView];
}

//顶部进度条
- (void)setTopView{
    
    [self.progressView removeFromSuperview];
    
    NSLog(@"%@",self.typeNumMuArr);
    
    NSMutableArray *arr = [NSMutableArray array];
    for (NSString *str in self.typeNumMuArr) {
        if ([str isEqualToString:@"1"]) {
            [arr addObject:str];
        }
    }
    
    self.progressNum = 5 - arr.count;
    for (int i = 0; i < arr.count; i++) {
        self.progressView = [[UIView alloc]init];
        self.progressView.frame = CGRectMake(Main_WIDTH/5 * i, 64, Main_WIDTH/5 - 2, 10);
        self.progressView.backgroundColor = RED;
        [self.view addSubview:self.progressView];
    }
    [self.tableView reloadData];
}



- (void)drawReadyView{
    
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Main_WIDTH, Main_HEIGHT - 0) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    _tableView.tableHeaderView = [self setTableHeader];
    
    [self setTopView];
    
}


- (UIView *)setTableHeader{
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_WIDTH, 280)];
    
    topView.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, Main_WIDTH, 265)];
    imgView.contentMode = UIViewContentModeScaleAspectFit;
    imgView.clipsToBounds  = YES;
    self.topImgView = imgView;
//    if (self.dic.count == 0) {
        [imgView setImage:[UIImage imageNamed:@"1470020274400339"]];
//    }else{
    
//        if (self.publishListModel.url) {
//            
//            [imgView sd_setImageWithURL:[NSURL URLWithString:[URLImg stringByAppendingString:self.publishListModel.url]] placeholderImage:[UIImage imageNamed:@"ppimg2"]];
//        }else{
//            [imgView setImage:[UIImage imageNamed:@"ppimg2"]];
//            
//        }
//    }
    
    [topView addSubview:imgView];
    
    UIButton *photoBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    photoBtn.frame = CGRectMake(20, 200, 50, 50);
    [photoBtn setBackgroundImage:[UIImage imageNamed:@"ppico14"] forState:UIControlStateNormal];
    [photoBtn addTarget:self action:@selector(photoPage) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:photoBtn];
    
    return topView;
    
}

//返回行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

//返回行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 4 ) {
        return 50;
    }else if (indexPath.row == 5){
        return 44;
    }
    return 80;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    

    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(Main_WIDTH - 50, 30, 20, 20)];
    if (indexPath.row < 4) {
        if ([self.typeNumMuArr[indexPath.row+1] isEqualToString:@"0"]) {
            imgView.image = [UIImage imageNamed:@"ppico36"];
        }
        else
        {
            imgView.image = [UIImage imageNamed:@"ppico37"];
        }
    }
    
    if (indexPath.row == 0) {
        
        __weak typeof(self) weakself = self;
//        _sketchVC.sketchBlock = ^(){
//            
//            [weakself.typeNumMuArr replaceObjectAtIndex:1 withObject:@"1"];
//            
//            [weakself setTopView];
//            
//            [weakself.tableView reloadData];
//        };
//        
        cell.textLabel.text = @"简述";
        cell.detailTextLabel.text = @"为您的组织的活动添加一个描述";
        cell.detailTextLabel.textColor = [UIColor lightGrayColor];
        [cell addSubview:imgView];
        
        
    }else if (indexPath.row == 1){
        __weak typeof(self) weakself = self;
        
//        _brandVC.brandBlock = ^(){
//            
//            [weakself.typeNumMuArr replaceObjectAtIndex:2 withObject:@"1"];
//            
//            [weakself setTopView];
//            
//            [weakself.tableView reloadData];
//            
//        };
        cell.textLabel.text = @"起始时间/地点/出发地";
        cell.detailTextLabel.text = @"为您的活动添加时间/地点/出发地";
        cell.detailTextLabel.textColor = [UIColor lightGrayColor];
        [cell addSubview:imgView];
        
    }else if (indexPath.row == 2){
        
        __weak typeof(self) weakself = self;
        
//        _priceVC.rentBlock = ^(){
//            [weakself.typeNumMuArr replaceObjectAtIndex:3 withObject:@"1"];
//            
//            [weakself setTopView];
//            
//            [weakself.tableView reloadData];
//        };
        cell.textLabel.text = @"费用";
        cell.detailTextLabel.text = @"为您的组织的活动添加每人的费用";
        cell.detailTextLabel.textColor = [UIColor lightGrayColor];
        [cell addSubview:imgView];
        
    }else if (indexPath.row == 3){
        
        __weak typeof(self) weakself = self;
//        
//        _addVC.addBlock = ^(){
//            [weakself.typeNumMuArr replaceObjectAtIndex:4 withObject:@"1"];
//            
//            [weakself setTopView];
//            
//            [weakself.tableView reloadData];
//            
//        };
        
        cell.textLabel.text = @"详细描述";
        cell.detailTextLabel.text = @"关于本次活动详细的描述";
        cell.detailTextLabel.textColor = [UIColor lightGrayColor];
        [cell addSubview:imgView];
        
    }else if (indexPath.row == 4){
        
        cell.backgroundColor = RED;
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 20)];
        label.center = CGPointMake(Main_WIDTH/2, 22);
        label.backgroundColor = RED;
        if ((long)self.progressNum == 0) {
            label.text = @"发布";
        }else{
            label.text = [NSString stringWithFormat:@"还有%ld项才可以发布",(long)self.progressNum];
        }
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:15];
        label.textAlignment = NSTextAlignmentCenter;
        [cell addSubview:label];
    }
    
    return cell;
    
}

////点击Cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"发布活动" message:@"添加图片,活动描述,活动信息等...(功能持续开发中...)" preferredStyle:1];
    
    UIAlertAction *Action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertAction *Action2 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [vc addAction:Action1];
    [vc addAction:Action2];
    
    [self presentViewController:vc animated:YES completion:nil];
    

//    if (indexPath.row == 0) {
//        _sketchVC.ID = self.ID;
//        _sketchVC.intro = self.publishListModel.intro;
//        [self.navigationController pushViewController:_sketchVC animated:YES];
//    }else if (indexPath.row == 1){
//        _brandVC.ID = self.ID;
//        _brandVC.brand = self.publishListModel.brand;
//        _brandVC.count = self.publishListModel.count;
//        _brandVC.name = self.publishListModel.name;
//        _brandVC.model = self.publishListModel.model;
//        [self.navigationController pushViewController:_brandVC animated:YES];
//    }else if (indexPath.row == 2){
//        _priceVC.ID = self.ID;
//        _priceVC.price = self.publishListModel.price;
//        _priceVC.deposit = self.publishListModel.deposit;
//        _priceVC.min_days = self.publishListModel.min_days;
//        _priceVC.renew_price = self.publishListModel.renew_price;
//        [self.navigationController pushViewController:_priceVC animated:YES];
//    }else if (indexPath.row == 3){
//        _addVC.ID = self.ID;
//        _addVC.detail_address = self.publishListModel.detail_address;
//        _addVC.publishListModel = self.publishListModel;
//        [self.navigationController pushViewController:_addVC animated:YES];
//    }else if (indexPath.row == 4){
//        _chioceVC.ID = self.ID;
//        _chioceVC.main_type = self.publishListModel.mail_type;
//        _chioceVC.get_type = self.publishListModel.get_type;
//        _chioceVC.desc = self.publishListModel.desc;
//        [self.navigationController pushViewController:_chioceVC animated:YES];
//    }else {
//
//        
//#pragma mark - 发布
//        
//        if (self.progressNum == 0) {
//            
//            NSString *pay_info = [UserDataAPI shareUserDataAPI].userModel.pay_info;
//            NSLog(@"%@",pay_info);
//            
//            if ([pay_info isEqualToString:@"0"]) {
//                
//                [MBProgressHUD showAlertWithTitle:@"提示" message:@"您还没有添加支付宝收款帐号，该账号默认将用于接收您的物品出租所得，请先去收款方式中设置" alertStyle:1 CancelActionTitle:@"取消" DefaultActionTitle:@"立即设置" CancelAction:^{
//                    
//                } DefaultAction:^{
//                    
//                    CollectOfMoneyController *vc = [CollectOfMoneyController new];
//                    vc.wherePublish = @"publish";
//                    [self.navigationController pushViewController:vc animated:YES];
//                    
//                } Controller:self];
//                
//            }else{
//                
//                if ([self.publishListModel.status isEqualToString:@"0"] || [self.publishListModel.status isEqualToString:@"1"]) {
//                    
//                    [MBProgressHUD showAlertWithTitle:@"提示" message:@"该物品已提交,是否需要重新提交" alertStyle:1 CancelActionTitle:@"取消" DefaultActionTitle:@"确定" CancelAction:^{
//                        
//                    } DefaultAction:^{
//                        
//                        [MBProgressHUD showLoading];
//                        [[PublishHelper sharePublishHelper] publishForID:self.ID Finish:^{
//
//                            [MBProgressHUD dismissLoading];
//                            [MBProgressHUD showMessage:@"发布成功等待审核"];
//                            [self.navigationController popViewControllerAnimated:YES];
//                        }];
//                        
//                    } Controller:self];
//                    
//                    
//                }else{
//                    
//                    
//                    [MBProgressHUD showLoading];
//                    [[PublishHelper sharePublishHelper] publishForID:self.ID Finish:^{
//                        [MBProgressHUD dismissLoading];
//
//                        [MBProgressHUD showMessage:@"发布成功等待审核"];
//
//                        [self.navigationController popToRootViewControllerAnimated:YES];
//                    }];
//                }
//            }
//        }else{
//            [MBProgressHUD showMessage:@"请全部填写完成才能发布"];
//        }
//    }
}

#pragma mark - 去照片页面
- (void)photoPage{
    
//    _photoVC.ID = self.ID;
//    
//    [self.navigationController pushViewController:_photoVC animated:YES];
//
    
    UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"发布活动" message:@"添加图片,活动描述,活动信息等...(功能持续开发中...)" preferredStyle:1];
    
    UIAlertAction *Action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertAction *Action2 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [vc addAction:Action1];
    [vc addAction:Action2];
    
    [self presentViewController:vc animated:YES completion:nil];
    

//
}

//- (void)readyPublishBack{
//    
//    [self.navigationController popToRootViewControllerAnimated:YES];
//}

//预览页面
- (void)nextPage{
    
    [self.navigationController pushViewController:[XTSingleController new] animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
