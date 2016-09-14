//
//  Comment.h
//  PP户外
//
//  Created by dabei on 16/1/23.
//  Copyright © 2016年 bing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Comment : NSObject
@property (nonatomic, strong) NSString *avatar;    //头像
@property (nonatomic, strong) NSString *content;   //评论
@property (nonatomic, strong) NSString *createtime; //时间
@property (nonatomic, strong) NSString *nickname;  //昵称
@property (nonatomic, strong) NSString *toContent;  //回复
@property (nonatomic, strong) NSArray *url;        //照片

/** cell的高 */
@property (nonatomic, assign) CGFloat cellHight;





@end
