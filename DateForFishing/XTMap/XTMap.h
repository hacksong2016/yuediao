//
//  XTMap.h
//  高德
//
//  Created by ZhengXiangteng on 16/4/15.
//  Copyright © 2016年 zxt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MAMapKit/MAMapKit.h>
#import <AMapLocationKit/AMapLocationKit.h>

@interface XTMap : NSObject
+ (instancetype)shareXTMap;

/** 普通单次定位 */
- (void)singleLocationFinish:(void(^)(NSString *latitude,NSString *longitude,NSString *formattedAddress,NSString *province,NSString *city,NSString *district))result
                     Failure:(void(^)())failure;


/**
 *  地图SDK中的定位功能
 */
@property (nonatomic, strong) MAMapView *mapView;

/** 显示位置 */
@property (nonatomic, strong) MAMapView *mapViewLocation;
- (void)mapViewWithFrame:(CGRect)frame Latitude:(NSString *)lat Longitude:(NSString *)lon Title:(NSString *)title SubTitle:(NSString *)subTitle;

@end
