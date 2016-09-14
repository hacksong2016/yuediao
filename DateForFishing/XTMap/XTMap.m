//
//  XTMap.m
//  高德
//
//  Created by ZhengXiangteng on 16/4/15.
//  Copyright © 2016年 zxt. All rights reserved.
//

#import "XTMap.h"

@interface XTMap ()<MAMapViewDelegate>
/** AMapLocationManager类 */
@property (nonatomic, strong) AMapLocationManager *locationManager;@end

@implementation XTMap

+ (instancetype)shareXTMap{
    static XTMap *map = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        map = [[XTMap alloc]init];
    });
    return map;
}

- (AMapLocationManager *)locationManager{
    if (!_locationManager) {
        _locationManager = [[AMapLocationManager alloc] init];
    }
    return _locationManager;
}

- (void)singleLocationFinish:(void(^)(NSString *latitude,NSString *longitude,NSString *formattedAddress,NSString *province,NSString *city,NSString *district))result
                     Failure:(void(^)())failure{

    // 带逆地理信息的一次定位（返回坐标和地址信息）
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    // 带逆地理（返回坐标和地址信息）
    [self.locationManager requestLocationWithReGeocode:YES completionBlock:^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error) {
        
        if (error)
        {
            NSLog(@"locError:{%ld - %@};", (long)error.code, error.localizedDescription);
            
            failure();
            if (error.code == AMapLocationErrorLocateFailed)
            {
                return;
            }
        }
        NSString *lat = [NSString stringWithFormat:@"%f",location.coordinate.latitude];
        NSString *lon = [NSString stringWithFormat:@"%f",location.coordinate.longitude];

        if (regeocode)
        {
            //NSLog(@"reGeocode:%@", regeocode);
            result(lat,lon,regeocode.formattedAddress,regeocode.province,regeocode.city,regeocode.district);
            NSLog(@"%@",regeocode.formattedAddress);
        }
    }];
}

- (MAMapView *)mapView{
    if (!_mapView) {
        _mapView = [[MAMapView alloc]init];
        _mapView.zoomLevel = 15.0f;

        _mapView.showsUserLocation = YES;    //YES 为打开定位，NO为关闭定位
        _mapView.delegate = self;
//        _mapView.userTrackingMode = MAUserTrackingModeFollowWithHeading;
        [_mapView setZoomLevel:16.1 animated:YES];
        [_mapView setUserTrackingMode: MAUserTrackingModeNone animated:YES]; //地图跟着位置移动
//        _mapView.scrollEnabled = NO;
    }
    return _mapView;
}

-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation
{
    
    
    //NSLog(@"latitude : %f,longitude: %f",userLocation.coordinate.latitude,userLocation.coordinate.longitude);

    
    //NSLog(@"%@-%@-%@",mapView,self.mapView,self.mapViewLocation);
    
    if ([mapView isEqual:self.mapView]) {
        
        if(updatingLocation)
        {
            //取出当前位置的坐标
            //NSLog(@"latitude : %f,longitude: %f",userLocation.coordinate.latitude,userLocation.coordinate.longitude);
            self.mapView.centerCoordinate = CLLocationCoordinate2DMake(userLocation.coordinate.latitude, userLocation.coordinate.longitude);

        }
    }
}


- (void)mapView:(MAMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
    if ([mapView isEqual:self.mapView]) {
        
        MAAnnotationView *view = views[0];
        
        // 放到该方法中用以保证userlocation的annotationView已经添加到地图上了。
        if ([view.annotation isKindOfClass:[MAUserLocation class]])
        {
            MAUserLocationRepresentation *pre = [[MAUserLocationRepresentation alloc] init];
            pre.fillColor = [UIColor clearColor];
            pre.strokeColor = [UIColor clearColor];
            pre.image = [UIImage imageNamed:@"定位1"];
            pre.lineWidth = 3;
            pre.lineDashPattern = @[@6, @3];
            
            [self.mapView updateUserLocationRepresentation:pre];
            
            view.calloutOffset = CGPointMake(0, 0);
            
        }
    }
}

//- (MAMapView *)mapViewLocation{
//    if (!_mapViewLocation) {
//        _mapViewLocation = [[MAMapView alloc] init];
//        //        _mapView.delegate = self;
//        ////        _mapView.showsUserLocation = YES;    //YES 为打开定位，NO为关闭定位
//        _mapViewLocation.zoomLevel = 15.0f;
////        [_mapViewLocation setUserTrackingMode: MAUserTrackingModeFollow animated:NO]; //地图跟着位置移动
//        _mapViewLocation.showsScale= NO;  //设置成NO表示不显示比例尺；YES表示显示比例尺
//        _mapViewLocation.showsCompass = NO; //设置成NO表示关闭指南针；YES表示显示指南针
//        _mapViewLocation.delegate = self;
//        _mapViewLocation.scrollEnabled = YES;
//
//    }
//    return _mapViewLocation;
//}

- (void)mapViewWithFrame:(CGRect)frame Latitude:(NSString *)lat Longitude:(NSString *)lon Title:(NSString *)title SubTitle:(NSString *)subTitle{
    
    self.mapViewLocation = [[MAMapView alloc]initWithFrame:frame];
    self.mapViewLocation.zoomLevel = 15.0f;
    self.mapViewLocation.delegate = self;
    self.mapViewLocation.scrollEnabled = NO;
    self.mapViewLocation.showsScale = YES;
    self.mapViewLocation.frame = frame;
    self.mapViewLocation.centerCoordinate = CLLocationCoordinate2DMake([lat doubleValue], [lon doubleValue]);
    MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
    pointAnnotation.coordinate = CLLocationCoordinate2DMake([lat doubleValue], [lon doubleValue]);
    pointAnnotation.title = title;
    pointAnnotation.subtitle = subTitle;
    [_mapViewLocation addAnnotation:pointAnnotation];
    
}

- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation
{
    if ([mapView isEqual:self.mapViewLocation]) {
        
        if ([annotation isKindOfClass:[MAPointAnnotation class]])
        {
            static NSString *reuseIndetifier = @"annotationReuseIndetifier";
            MAAnnotationView *annotationView = (MAAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:reuseIndetifier];
            if (annotationView == nil)
            {
                annotationView = [[MAAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseIndetifier];
            }
            annotationView.image = [UIImage imageNamed:@"定位1"];
            //设置中心点偏移，使得标注底部中间点成为经纬度对应点
            annotationView.centerOffset = CGPointMake(0, -18);
            annotationView.canShowCallout= YES;       //设置气泡可以弹出，默认为NO
            annotationView.draggable = YES;        //设置标注可以拖动，默认为NO
            return annotationView;
        }
    }
    return nil;
}




@end
