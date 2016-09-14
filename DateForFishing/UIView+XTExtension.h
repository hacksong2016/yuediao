//
//  UIView+XTExtension.h
//  百思不得姐
//
//  Created by ZhengXiangteng on 16/4/6.
//  Copyright © 2016年 前辈丶. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XTExtension)

@property (nonatomic , assign) CGSize size;
@property (nonatomic , assign) CGFloat width;
@property (nonatomic , assign) CGFloat height;
@property (nonatomic , assign) CGFloat x;
@property (nonatomic , assign) CGFloat y;

//- (CGFloat)x;
//- (void)setX:(CGFloat)x;
/** 在分类中声明@property, 只会生成方法的声明, 不会生成方法的实现和带有_下划线的成员变量*/
@end
