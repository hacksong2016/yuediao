//
//  XTMessageCell.h
//  聊天
//
//  Created by ZhengXiangteng on 16/4/1.
//  Copyright © 2016年 前辈丶. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XTMessage.h"

@interface XTMessageCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

/** message */
@property (nonatomic, strong) XTMessage *message;


@end
