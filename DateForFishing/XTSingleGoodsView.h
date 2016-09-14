//
//  XTSingleGoodsView.h
//  zxcv
//
//  Created by ZhengXiangteng on 16/4/13.
//  Copyright © 2016年 前辈丶. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"

@protocol XTSingleGoodsViewDelegate <NSObject>
/**
 *  聊天
 */
- (void)chatWithPerson;
/**
 *  查看全部评论
 */
- (void)allComments;
/**
 *  查看全部描述
 */
- (void)allDetailed;
/**
 *  放大地图
 */
- (void)zoomInMapView;
/**
 *  收藏
 */
- (void)collectionGoods:(UIButton *)button;
/**
 *  选择日期
 */
- (void)choseDate;
/**
 *  打电话
 */
- (void)Callup;
@end

@interface XTSingleGoodsView : UIView

+ (instancetype)singleGoodsView;
/** 单个商品Model */
//@property (nonatomic, strong)GoodsModel *goodsModel;
/** XTSingleGoodsView代理 */
@property (nonatomic, weak) id<XTSingleGoodsViewDelegate> delegate;

/** 选择开始时间 */
@property (nonatomic, strong) UIButton *startTimeBtn;
/** 选择结束时间 */
@property (nonatomic, strong) UIButton *endTimeBtn;
/** 轮播图 */
@property (nonatomic, strong) SDCycleScrollView *topView;
/** 可租数量 */
@property (nonatomic, strong) UILabel *amountCount;



@end
