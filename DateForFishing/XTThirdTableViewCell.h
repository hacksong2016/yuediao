//
//  XTThirdTableViewCell.h
//  DateForFishing
//
//  Created by ZhengXiangteng on 16/9/8.
//  Copyright © 2016年 前辈丶. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Comment.h"
@protocol XTThirdTableViewCellDelegate <NSObject>

- (void)thirdTableViewCellsearcimage:(UIButton *)button;

- (void)thirdTableViewCellbutton:(UIButton *)button;

@end
@interface XTThirdTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

/** comment模型 */
@property (nonatomic, strong) Comment *comment;

@property (nonatomic, weak) id<XTThirdTableViewCellDelegate> delegate;

@end
