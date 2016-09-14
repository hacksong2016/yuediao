//
//  XTMessage.h
//  聊天
//
//  Created by ZhengXiangteng on 16/4/1.
//  Copyright © 2016年 前辈丶. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    XTMessageTypeMe = 0,
    XTMessageTypeOther
}XTMessageType;
@interface XTMessage : NSObject
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *time;
/** 消息来源 */
@property (nonatomic, assign) XTMessageType type;

/** cell高度 */
@property (nonatomic, assign) CGFloat cellHeight;

/** 是否隐藏时间 */
@property (nonatomic, assign, getter=isHiddeTime) BOOL hiddeTime;

+ (instancetype)messageWithDic:(NSDictionary *)dic;


@end
