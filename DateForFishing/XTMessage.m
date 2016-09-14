//
//  XTMessage.m
//  聊天
//
//  Created by ZhengXiangteng on 16/4/1.
//  Copyright © 2016年 前辈丶. All rights reserved.
//

#import "XTMessage.h"

@implementation XTMessage

+ (instancetype)messageWithDic:(NSDictionary *)dic{
    XTMessage *message = [[XTMessage alloc]init];
    [message setValuesForKeysWithDictionary:dic];
    return message;
}

@end
