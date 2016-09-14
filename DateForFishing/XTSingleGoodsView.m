//
//  XTSingleGoodsView.m
//  zxcv
//
//  Created by ZhengXiangteng on 16/4/13.
//  Copyright © 2016年 前辈丶. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "XTSingleGoodsView.h"
//#import <MAMapKit/MAMapKit.h>
//#import <AMapLocationKit/AMapLocationKit.h>
//define this constant if you want to use Masonry without the 'mas_' prefix
//#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#import "XTMap.h"

@interface XTSingleGoodsView ()<UIScrollViewDelegate>
/** scrillView */
@property (nonatomic, strong) UIScrollView *scrollView;
/** 收藏 */
@property (nonatomic, strong) UIButton *collectionBtn;
/** 租金下的View */
@property (nonatomic, strong) UIView *priceView;
/** 租金 */
//@property (nonatomic, strong) UILabel *priceLab;
/** 租金2 */
//@property (nonatomic, strong) UILabel *priceLab2;
/** 续租 */
@property (nonatomic, strong) UILabel *renew_priceLab;
/** 起租期 */
//@property (nonatomic, strong) UILabel *min_days;
/** contentView */
@property (nonatomic, strong) UIView *contentView;
/** 简介 */
@property (nonatomic, strong) UILabel *introductionLabel;
/** 头像 */
@property (nonatomic, strong) UIImageView *iconImgView;
/** 昵称 */
@property (nonatomic, strong) UILabel *nicknameLab;
/** 聊天按钮 */
@property (nonatomic, strong) UIButton *chatBtn;
/** 电话 */
@property (nonatomic, strong) UIButton *phoneBtn;
/** 品牌名称下的View */
@property (nonatomic, strong) UIView *view1;
/** 品牌型号btn */
@property (nonatomic, strong) UIButton *brandBtn;
/** 品牌 */
@property (nonatomic, strong) UILabel *brandLab;
/** 型号 */
@property (nonatomic, strong) UILabel *modelLab;
/** 押金btn */
@property (nonatomic, strong) UIButton *depositBtn;
/** 押金 */
@property (nonatomic, strong) UILabel *depositLab;
/** 交货方式btn */
@property (nonatomic, strong) UIButton *mail_typeBtn;
/** 交货方式 */
@property (nonatomic, strong) UILabel *mail_typeLab;
/** 评论总数 */
@property (nonatomic, strong) UILabel *commontNumLab;
/** 评论人 */
@property (nonatomic, strong) UILabel *commontPersonLab;
/** 评论时间 */
@property (nonatomic, strong) UILabel *commonttimeLab;
/** 一条评论 */
@property (nonatomic, strong) UILabel *commontLab;
/** 查看全部评论 */
@property (nonatomic, strong) UIButton *commontBtn;
/** 地图 */
@property (nonatomic, strong) UIView *mapView;
/** 地图上的位置 */
@property (nonatomic, strong) UILabel *mapLab;
/** 物品描述title */
@property (nonatomic, strong) UILabel *detailedLab;
/** 物品描述 */
@property (nonatomic, strong) UILabel *introLab;
/** 查看全部描述 */
@property (nonatomic, strong) UIButton *introBtn;
/** 物品图片 */
@property (nonatomic, strong) UIImageView *goodsImgView;
/** 物品详情 */
@property (nonatomic, strong) UILabel *detailsLab;
/** 底部的View */
@property (nonatomic, strong) UIView *bottomView;
/** 交货方式(底部) */
@property (nonatomic, strong) UILabel *transportationLab;
/** 回收方式(底部) */
@property (nonatomic, strong) UILabel *recoveryModeLab;

@end

@implementation XTSingleGoodsView

+ (instancetype)singleGoodsView{
    return [[self alloc]init];
}

- (UIScrollView *)scrollView{
    if (!_scrollView) {
        UIScrollView *scorllView = [[UIScrollView alloc]init];
        scorllView.delegate = self;
        scorllView.backgroundColor = [UIColor whiteColor];
        [self addSubview:scorllView];
        _scrollView = scorllView;
    }
    return _scrollView;
}

- (UIView *)contentView{
    if (!_contentView) {
        UIView *contentView = [[UIView alloc]init];
        contentView.backgroundColor = [UIColor whiteColor];
        [self.scrollView addSubview:contentView];
        _contentView = contentView;
    }
    return _contentView;
}
- (UIView *)topView{
    if (!_topView) {
        SDCycleScrollView *topView = [[SDCycleScrollView alloc]init];
        topView.backgroundColor = [UIColor whiteColor];
        topView.bannerImageViewContentMode = UIViewContentModeScaleAspectFit;
        
        topView.imageURLStringsGroup = @[@"http://img0.ph.126.net/R5svLH7gyC3yqIf7OvDZmQ==/6598218756307113675.jpg",@"http://images4.c-ctrip.com/target/tg/945/847/853/981e8dbb7bc344a0833ed59f422bc53e.jpg",@"http://xnxwimg.cncn.net/p10071/34/9d49_b.jpg",@"http://pic77.nipic.com/file/20150906/7874840_003913276000_2.jpg",@"http://pic24.nipic.com/20121008/2654870_113036447107_2.jpg"];
        
        
        [self.contentView addSubview:topView];
        _topView = topView;
    }
    return _topView;
}

- (UIButton *)collectionBtn{
    if (!_collectionBtn) {
        UIButton *chatBtn = [[UIButton alloc]init];
        [chatBtn addTarget:self action:@selector(collectionBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.topView addSubview:chatBtn];
        _collectionBtn = chatBtn;
    }
    return _collectionBtn;
}

- (UIView *)priceView{
    if (!_priceView) {
        UIView *price = [[UIView alloc]initWithFrame:CGRectMake(0, (Main_WIDTH * 3.3) / 5 - 30, 100, 30)];
        price.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        [self.topView addSubview:price];
        _priceView = price;
    }
    return _priceView;
}
//
//- (UILabel *)priceLab{
//    if (!_priceLab) {
//        UILabel *priceLab = [[UILabel alloc]init];
//        priceLab.font = [UIFont systemFontOfSize:15];
//        priceLab.textAlignment = NSTextAlignmentCenter;
//        priceLab.textColor = [UIColor whiteColor];
//        [self.priceView addSubview:priceLab];
//        _priceLab = priceLab;
//    }
//    return _priceLab;
//}

//- (UILabel *)priceLab2{
//    if (!_priceLab2) {
//        
//        UILabel *priceLab2 = [[UILabel alloc]init];
////        priceLab2.font = [UIFont systemFontOfSize:15];
////        priceLab2.textAlignment = NSTextAlignmentCenter;
////        priceLab2.textColor = ;
//        [priceLab2 setFont:[UIFont fontWithName:@"Helvetica-Bold" size:16]];
//        [self.contentView addSubview:priceLab2];
//        _priceLab2 = priceLab2;
//    }
//    return _priceLab2;
//}

- (UILabel *)renew_priceLab{
    
    if (!_renew_priceLab) {
        
        UILabel *renew_priceLab = [[UILabel alloc]init];
        renew_priceLab.font = [UIFont systemFontOfSize:14];
        [renew_priceLab setFont:[UIFont fontWithName:@"Helvetica-Bold" size:16]];
        renew_priceLab.text = @"发起者";
        [self.contentView addSubview:renew_priceLab];
        _renew_priceLab = renew_priceLab;
    }
    return _renew_priceLab;
    
}

//- (UILabel *)min_days{
//    if (!_min_days) {
//        UILabel *min_days = [[UILabel alloc]init];
//        min_days.font = [UIFont systemFontOfSize:14];
////        min_days.textColor = RED;
////        min_days.layer.borderColor = [UIColor redColor].CGColor;//边框颜色,要为CGColor
////        min_days.layer.borderWidth = 1;//边框宽度
//        [self.contentView addSubview:min_days];
//        _min_days = min_days;
//    }
//    return _min_days;
//}

- (UILabel *)introductionLabel{
    if (!_introductionLabel) {
        UILabel *introductionLabel = [[UILabel alloc]init];
        introductionLabel.numberOfLines = 0;
        introductionLabel.font = [UIFont systemFontOfSize:15];
        introductionLabel.textAlignment = NSTextAlignmentCenter;
        introductionLabel.text = @"渔山列岛 激情爆钓 3天2夜";
        [self.contentView addSubview:introductionLabel];
        _introductionLabel = introductionLabel;
    }
    return _introductionLabel;
}

- (UIImageView *)iconImgView{
    if (!_iconImgView) {
        UIImageView *iconImgView = [[UIImageView alloc]init];
        iconImgView.layer.cornerRadius = 25;
        iconImgView.layer.masksToBounds = YES;
        iconImgView.image = [UIImage imageNamed:@"1470020274400339"];
        [self.contentView addSubview:iconImgView];
        _iconImgView = iconImgView;
    }
    return _iconImgView;
}

- (UILabel *)nicknameLab{
    if (!_nicknameLab) {
        UILabel *nicknameLab = [[UILabel alloc]init];
        nicknameLab.text = @"3630俱乐部";
        nicknameLab.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:nicknameLab];
        _nicknameLab = nicknameLab;
    }
    return _nicknameLab;
}

- (UIButton *)chatBtn{
    if (!_chatBtn) {
        UIButton *chatBtn = [[UIButton alloc]init];
        [chatBtn setBackgroundImage:[UIImage imageNamed:@"ppios_2x01"] forState:UIControlStateNormal];
        [chatBtn addTarget:self action:@selector(chatBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:chatBtn];
        _chatBtn = chatBtn;
    }
    return _chatBtn;
}

- (UIButton *)phoneBtn{
    if (!_phoneBtn) {
        UIButton *phoneBtn = [[UIButton alloc]init];
        [phoneBtn setBackgroundImage:[UIImage imageNamed:@"电话"] forState:UIControlStateNormal];
//        phoneBtn.backgroundColor = [UIColor redColor];
        [phoneBtn addTarget:self action:@selector(phoneBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:phoneBtn];
        _phoneBtn = phoneBtn;
    }
    return _phoneBtn;
}

- (UIView *)view1{
    if (!_view1) {
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = BACKGROUNDCOLOR;
        [self.contentView addSubview:view];
        _view1 = view;
    }
    return _view1;
}

- (UIButton *)brandBtn{
    if (!_brandBtn) {
        UIButton *button = [[UIButton alloc]init];
        [button setTitle:@"起止时间" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"日期"] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        [self.view1 addSubview:button];
        _brandBtn = button;
    }
    return _brandBtn;
}

- (UILabel *)brandLab{
    if (!_brandLab) {
        UILabel *label = [UILabel new];
        label.font = [UIFont systemFontOfSize:15];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"2016年10月01日";
        [self.view1 addSubview:label];
        _brandLab = label;
    }
    return _brandLab;
}

- (UILabel *)modelLab{
    if (!_modelLab) {
        UILabel *label = [UILabel new];
        label.font = [UIFont systemFontOfSize:15];
        label.numberOfLines = 0;
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"2016年10月04日";

        [self.view1 addSubview:label];
        _modelLab = label;
    }
    return _modelLab;
}

- (UIButton *)depositBtn{
    if (!_depositBtn) {
        UIButton *button = [[UIButton alloc]init];
        [button setTitle:@"费用" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"费用"] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        [self.view1 addSubview:button];
        _depositBtn = button;
    }
    return _depositBtn;
}

- (UILabel *)depositLab{
    if (!_depositLab) {
        UILabel *label = [UILabel new];
        label.font = [UIFont systemFontOfSize:15];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"¥1000";
        [self.view1 addSubview:label];
        _depositLab = label;
    }
    return _depositLab;
}

- (UIButton *)mail_typeBtn{
    if (!_mail_typeBtn) {
        UIButton *button = [[UIButton alloc]init];
        [button setTitle:@"出发地点" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"出发地"] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        [self.view1 addSubview:button];
        _mail_typeBtn = button;
    }
    return _mail_typeBtn;
}
- (UILabel *)mail_typeLab{
    if (!_mail_typeLab) {
        UILabel *label = [UILabel new];
        label.font = [UIFont systemFontOfSize:15];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"北京国际机场";
        [self.view1 addSubview:label];
        _mail_typeLab = label;
    }
    return _mail_typeLab;
}

- (UILabel *)commontNumLab{
    if (!_commontNumLab) {
        UILabel *label = [UILabel new];
        label.text = @"共6条评论";
        label.font = [UIFont systemFontOfSize:15];
        label.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:label];
        _commontNumLab = label;
    }
    return _commontNumLab;
}

- (UILabel *)commontPersonLab{
    if (!_commontPersonLab) {
        UILabel *label = [UILabel new];
        label.text = @"Tom";
        label.font = [UIFont systemFontOfSize:14];
        label.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:label];
        _commontPersonLab = label;
    }
    return _commontPersonLab;
}

- (UILabel *)commonttimeLab{
    if (!_commonttimeLab) {
        UILabel *label = [UILabel new];
        label.text = @"2016年04月13日";
        label.font = [UIFont systemFontOfSize:14];
        label.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:label];
        _commonttimeLab = label;
    }
    return _commonttimeLab;
}

- (UILabel *)commontLab{
    if (!_commontLab) {
        UILabel *label = [UILabel new];
        label.text = @"真的挺不错的,上次也是一起跟着俱乐部一起去的,学到了很多,也交了好多朋友,期待下一次";
        label.numberOfLines = 0;
        label.font = [UIFont systemFontOfSize:15];
        label.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:label];
        _commontLab = label;
    }
    return _commontLab;
}

- (UIButton *)commontBtn{
    if (!_commontBtn) {
        UIButton *button = [[UIButton alloc]init];
        [button setBackgroundImage:[UIImage imageNamed:@"ppios_2x02"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(commontBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:button];
        _commontBtn = button;
    }
    return _commontBtn;
}

- (UIView *)mapView{
    if (!_mapView) {
        UIView *mapView = [[UIView alloc]init];
//        mapView.backgroundColor = [UIColor redColor];
//        mapView.showsScale= NO;  //设置成NO表示不显示比例尺；YES表示显示比例尺
//        mapView.showsCompass = NO; //设置成NO表示关闭指南针；YES表示显示指南针
//        mapView.scrollEnabled = NO;
     
        [self.contentView addSubview:mapView];
        _mapView = mapView;
    }
    return _mapView;
}

- (UILabel *)mapLab{
    if (!_mapLab) {
        UILabel *label = [[UILabel alloc]init];
        label.backgroundColor = [UIColor lightGrayColor];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.layer.cornerRadius = 5;
        label.layer.masksToBounds = YES;
        label.font = [UIFont systemFontOfSize:14];
        label.numberOfLines = 0;
        label.text = @"渔山列岛";
        [self.mapView addSubview:label];
        _mapLab = label;
    }
    return _mapLab;
}

- (UILabel *)detailedLab{
    if (!_detailedLab) {
        UILabel *lable = [[UILabel alloc]init];
        lable.text = @"活动描述";
        [self.contentView addSubview:lable];
        _detailedLab = lable;
    }
    return _detailedLab;
}
- (UILabel *)introLab{
    if (!_introLab) {
        UILabel *lable = [[UILabel alloc]init];
        lable.text = @"本次活动在9月1起启动预约,在2016年10月1日正式出发,进行为期3天的海钓,具体活动请看详细描述,或者咨询活动组织者";
        lable.numberOfLines = 0;
        lable.font = [UIFont systemFontOfSize:14];
        lable.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:lable];
        _introLab = lable;
    }
    return _introLab;
}
- (UIButton *)introBtn{
    if (!_introBtn) {
        UIButton *button = [[UIButton alloc]init];
        [button setBackgroundImage:[UIImage imageNamed:@"ppios_03"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(iniroBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:button];
        _introBtn = button;
    }
    return _introBtn;
}

- (UIImageView *)goodsImgView{
    if (!_goodsImgView) {
        UIImageView *imgView = [[UIImageView alloc]init];
        imgView.backgroundColor = [UIColor whiteColor];
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        imgView.image = [UIImage imageNamed:@"1467267793117505"];
        [self.contentView addSubview:imgView];
        _goodsImgView = imgView;
    }
    return _goodsImgView;
}
- (UILabel *)detailsLab{
    if (!_detailsLab) {
        UILabel *lable = [[UILabel alloc]init];
        lable.text = @"已预约的钓友";
        lable.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:lable];
        _detailsLab = lable;
    }
    return _detailsLab;
}

- (UIView *)bottomView{
    if (!_bottomView) {
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:view];
        _bottomView = view;
    }
    return _bottomView;
}
- (UILabel *)amountCount{
    if (!_amountCount) {
        UILabel *label = [[UILabel alloc]init];
        label.textAlignment = NSTextAlignmentRight;
        label.font = [UIFont systemFontOfSize:14];
        [self.bottomView addSubview:label];
        _amountCount = label;
    }
    return _amountCount;
}

- (UILabel *)transportationLab{
    if (!_transportationLab) {
        UILabel *label = [[UILabel alloc]init];
        label.textAlignment = NSTextAlignmentRight;
        label.font = [UIFont systemFontOfSize:14];
        [self.bottomView addSubview:label];
        _transportationLab = label;
    }
    return _transportationLab;
}

- (UILabel *)recoveryModeLab{
    if (!_recoveryModeLab) {
        UILabel *label = [[UILabel alloc]init];
        label.textAlignment = NSTextAlignmentRight;
        label.font = [UIFont systemFontOfSize:14];
        [self.bottomView addSubview:label];
        _recoveryModeLab = label;
    }
    return _recoveryModeLab;
}

- (UIButton *)startTimeBtn{
    if (!_startTimeBtn) {
        UIButton *button = [[UIButton alloc]init];
        [button setTitle:@"2016.4.28" forState:UIControlStateNormal];
//        [button setBackgroundColor:RED];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(choseTime:) forControlEvents:UIControlEventTouchUpInside];
        [self.bottomView addSubview:button];
        _startTimeBtn = button;
    }
    return _startTimeBtn;
}

- (UIButton *)endTimeBtn{
    if (!_endTimeBtn) {
        UIButton *button = [[UIButton alloc]init];
        [button setTitle:@"2016.5.28" forState:UIControlStateNormal];
//        [button setBackgroundColor:RED];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(choseTime:) forControlEvents:UIControlEventTouchUpInside];
        [self.bottomView addSubview:button];
        _endTimeBtn = button;
    }
    return _endTimeBtn;
}

#pragma mark - layoutSubviews
- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat spacing = 10;
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];

    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
    }];
        
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(0);
        make.height.equalTo((Main_WIDTH * 3.3) / 5);
    }];
    
//    [self.priceView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.equalTo(30);
//        make.width.equalTo(100);
//        make.left.bottom.equalTo(0);
//    }];
//    
//    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.equalTo(20);
//        make.width.equalTo(100);
//        make.center.equalTo(self.priceView);
//    }];
    
    [self.collectionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(20);
        make.right.equalTo(-20);
        make.width.height.equalTo(30);
    }];

    [self.introductionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.topView.mas_bottom).offset(spacing);
        make.left.equalTo(25);
        make.right.equalTo(-25);
    }];
    
    [self.renew_priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.introductionLabel.mas_bottom).offset(spacing);
        make.centerX.equalTo(self);
        
    }];
    
//    [self.priceLab2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.renew_priceLab);
//        make.right.equalTo(self.renew_priceLab.mas_left).offset(-10);
//        
//    }];
//    
//    [self.min_days mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.renew_priceLab);
//        make.left.equalTo(self.renew_priceLab.mas_right).offset(10);
//        
//    }];
    
    

    
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.renew_priceLab.mas_bottom).offset(spacing);
        make.width.height.equalTo(50);
        make.centerX.equalTo(self);
    }];
    
    [self.nicknameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImgView.mas_bottom).offset(spacing);
        make.width.equalTo(200);
        make.centerX.equalTo(self);
    }];
    
    [self.chatBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nicknameLab.mas_bottom).offset(spacing);
        make.width.equalTo(134/1.5);
        make.height.equalTo(42/1.5);
        make.centerX.equalTo(self);
    }];
    
    [self.phoneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.chatBtn.mas_right).offset(spacing);
        make.width.height.equalTo(30);
        make.centerY.equalTo(self.chatBtn.mas_centerY);
    }];
    
    [self.view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.chatBtn.mas_bottom).offset(spacing);
        make.left.right.equalTo(0);
    }];
    
    [self.brandBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view1.mas_top).offset(spacing);
        make.width.equalTo(100);
        make.height.equalTo(20);
        make.centerX.equalTo(self);
    }];
    
    [self.brandLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.brandBtn.mas_bottom).offset(spacing);
        make.width.equalTo(200);
        make.height.equalTo(20);
        make.centerX.equalTo(self);
    }];
    
    [self.modelLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.brandLab.mas_bottom).offset(spacing);
        make.width.equalTo(200);
        make.centerX.equalTo(self);
    }];

    
    [self.depositBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.modelLab.mas_bottom).offset(spacing);
        make.width.equalTo(100);
        make.height.equalTo(20);
        make.centerX.equalTo(self);
    }];

    [self.depositLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.depositBtn.mas_bottom).offset(spacing);
        make.width.equalTo(200);
        make.height.equalTo(20);
        make.centerX.equalTo(self);
    }];

    
    [self.mail_typeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.depositLab.mas_bottom).offset(spacing);
        make.width.equalTo(100);
        make.height.equalTo(20);
        make.centerX.equalTo(self);
    }];
    
    [self.mail_typeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mail_typeBtn.mas_bottom).offset(spacing);
        make.width.equalTo(200);
        make.height.equalTo(20);
        make.centerX.equalTo(self);
    }];
    
    [self.view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mail_typeLab.mas_bottom).offset(spacing);
    }];
    
    [self.commontNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view1.mas_bottom).offset(spacing);
        make.width.equalTo(200);
        make.height.equalTo(20);
        make.centerX.equalTo(self);
    }];
    
    [self.commontPersonLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.commontNumLab.mas_bottom).offset(spacing);
        make.centerX.equalTo(self);
    }];
    
    [self.commonttimeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.commontNumLab.mas_bottom).offset(spacing);
        make.left.equalTo(self.commontPersonLab.mas_right).offset(spacing);
    }];
    
    [self.commontLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.commonttimeLab.mas_bottom).offset(spacing);
        make.left.equalTo(25);
        make.right.equalTo(-25);
    }];
    
    [self.commontBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.commontLab.mas_bottom).offset(spacing);
        make.width.equalTo(113);
        make.height.equalTo(84/3);
        make.centerX.equalTo(self);
    }];
    
    
    
    [self.mapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.commontBtn.mas_bottom).offset(spacing);
        make.width.equalTo(Main_WIDTH);
        make.height.equalTo(250);
    }];
    
    XTMap *map = [XTMap shareXTMap];
    CGRect frame = self.mapView.frame;
    
    [map mapViewWithFrame:frame Latitude:@"116.424395" Longitude:@"39.845138" Title:@"" SubTitle:@""];
    [self.mapView addSubview:map.mapViewLocation];
    
    
    [self.mapLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(200);
//        make.width.equalTo(200);
        make.centerX.equalTo(self.mapView);
    }];
    
    [self.detailedLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mapView.mas_bottom).offset(spacing);
        make.height.equalTo(20);
        make.centerX.equalTo(self);
    }];
    
    [self.introLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.detailedLab.mas_bottom).offset(spacing);
        make.left.equalTo(25);
        make.right.equalTo(-25);
    }];
    
    [self.introBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.introLab.mas_bottom).offset(spacing);
        make.width.equalTo(168/1.5);
        make.height.equalTo(42/1.5);
        make.centerX.equalTo(self);
    }];
    
    [self.goodsImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.introBtn.mas_bottom).offset(spacing);
        make.width.equalTo(Main_WIDTH);
        make.height.equalTo((Main_WIDTH * 3.3) / 5);
        make.centerX.equalTo(self);
    }];
    
    [self.detailsLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodsImgView.mas_bottom).offset(spacing);
        make.width.equalTo(110);
        make.height.equalTo(30);
        make.centerX.equalTo(self);
    }];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.detailsLab.mas_bottom).offset(spacing);
        make.width.equalTo(Main_WIDTH);
        make.height.equalTo(200);
    }];
    
    
    CGFloat W = (Main_WIDTH - 60)/5.0;
    
    
    for (int i = 0; i < 5; i++) {
        UIImageView *imgView = [[UIImageView alloc]init];
        NSString *str = [NSString stringWithFormat:@"%d",i];
        imgView.image = [UIImage imageNamed:str];
        imgView.frame = CGRectMake(10 + (W + 10 )* i, 10, W, W);
        imgView.layer.cornerRadius = W/2.0;
        imgView.layer.masksToBounds = YES;
        [self.bottomView addSubview:imgView];
        
    }
    
    for (int i = 0; i < 3; i++) {
        UIImageView *imgView = [[UIImageView alloc]init];
        NSString *str = [NSString stringWithFormat:@"%d",4 + i];
        imgView.image = [UIImage imageNamed:str];
        imgView.frame = CGRectMake(10 + (W + 10 )* i, 20 + W, W, W);
        imgView.layer.cornerRadius = W/2.0;
        imgView.layer.masksToBounds = YES;
        [self.bottomView addSubview:imgView];
        
    }
    
    
    
//    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bottomView.mas_bottom).offset(50);
    }];
    
  
    

//    
//    UIView *map_view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_WIDTH, 250)];
//    map_view.backgroundColor = [UIColor clearColor];
//    map_view.alpha = 1;
//    
//    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(bigMap)];
//    [map_view addGestureRecognizer:recognizer];
//    [_mapView addSubview:map_view];
//    [self.scrollView addSubview:_mapView];
}


#pragma mark - 赋值 -



- (void)chatBtnClick{
    if (_delegate && [_delegate respondsToSelector:@selector(chatWithPerson)]) {
        [self.delegate chatWithPerson];
    }
}

- (void)commontBtnClick{
    if (_delegate && [_delegate respondsToSelector:@selector(allComments)]) {
        [self.delegate allComments];
    }
}

- (void)iniroBtnClick{
    if (_delegate && [_delegate respondsToSelector:@selector(allDetailed)]) {
        [self.delegate allDetailed];
    }
}

- (void)bigMap{
    
    if (_delegate && [_delegate respondsToSelector:@selector(zoomInMapView)]) {
        [self.delegate zoomInMapView];
    }
}

- (void)collectionBtnClick:(UIButton *)button{
    
    if (_delegate && [_delegate respondsToSelector:@selector(collectionGoods:)]) {
        [self.delegate collectionGoods:button];
    }
}

- (void)choseTime:(UIButton *)button{
    if (_delegate && [_delegate respondsToSelector:@selector(choseDate)]) {
        [self.delegate choseDate];
    }
}

- (void)phoneBtnClick{
    if (_delegate && [_delegate respondsToSelector:@selector(Callup)]) {
        [self.delegate Callup];
    }
}

//- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation
//{
//    if ([annotation isKindOfClass:[MAPointAnnotation class]])
//    {
//        static NSString *reuseIndetifier = @"annotationReuseIndetifier";
//        MAAnnotationView *annotationView = (MAAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:reuseIndetifier];
//        if (annotationView == nil)
//        {
//            annotationView = [[MAAnnotationView alloc] initWithAnnotation:annotation
//                                                          reuseIdentifier:reuseIndetifier];
//        }
//        annotationView.image = [UIImage imageNamed:@"IMG_410*10"];
//        //设置中心点偏移，使得标注底部中间点成为经纬度对应点
//        annotationView.centerOffset = CGPointMake(0, -18);
//        return annotationView;
//    }
//    return nil;
//}


//- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation
//{
//    if ([annotation isKindOfClass:[MAPointAnnotation class]])
//    {
//        static NSString *pointReuseIndentifier = @"pointReuseIndentifier";
//        MAPinAnnotationView*annotationView = (MAPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndentifier];
//        if (annotationView == nil)
//        {
//            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndentifier];
//        }
//        annotationView.canShowCallout= YES;       //设置气泡可以弹出，默认为NO
//        annotationView.animatesDrop = YES;        //设置标注动画显示，默认为NO
//        annotationView.draggable = YES;        //设置标注可以拖动，默认为NO
//        annotationView.pinColor = MAPinAnnotationColorPurple;
//        return annotationView;
//    }
//    return nil;
//}


@end
