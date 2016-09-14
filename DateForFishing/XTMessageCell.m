//
//  XTMessageCell.m
//  聊天
//
//  Created by ZhengXiangteng on 16/4/1.
//  Copyright © 2016年 前辈丶. All rights reserved.
//
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#import "XTMessageCell.h"

@interface XTMessageCell ()

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *textButton;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UIButton *otherTextButton;
@property (weak, nonatomic) IBOutlet UIImageView *otherIconView;

@end

@implementation XTMessageCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"XTMessageCell";
    XTMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    }
    return cell;    
}


- (void)awakeFromNib {

    //是聊天的button中的文字换行
    self.otherTextButton.titleLabel.numberOfLines = 0;
    self.textButton.titleLabel.numberOfLines = 0;
}

- (void)setMessage:(XTMessage *)message{
    _message = message;

    self.timeLabel.text = message.time;
    

    if (message.isHiddeTime) {//如果时间戳隐藏
        self.timeLabel.hidden = YES;
        //跟新时间戳的frame,
        [self.timeLabel updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(0);
        }];
    }else{
        self.timeLabel.hidden = NO;
        [self.timeLabel updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(20);
        }];
    }

    if (message.type == XTMessageTypeMe) {//如果信息是自己的
        [self settingShowTextButton:self.textButton ShowIconView:self.iconView HiddeButton:self.otherTextButton HiddeIconView:self.otherIconView];
    }else{
        [self settingShowTextButton:self.otherTextButton ShowIconView:self.otherIconView HiddeButton:self.textButton HiddeIconView:self.iconView];
    }

    
}

- (void)settingShowTextButton:(UIButton *)showTextButton ShowIconView:(UIImageView *)showIconView HiddeButton:(UIButton *)hiddeTextButton HiddeIconView:(UIImageView *)hiddeIconView{
    
    showTextButton.hidden = NO;
    showIconView.hidden = NO;
    hiddeIconView.hidden = YES;
    hiddeTextButton.hidden = YES;
    
    //设置按钮的文字
    [showTextButton setTitle:self.message.text forState:UIControlStateNormal];
    
    //强制更新
    [showTextButton layoutIfNeeded];

    // 设置按钮的高度就是titleLabel的高度
    [showTextButton updateConstraints:^(MASConstraintMaker *make) {
        CGFloat buttonH = showTextButton.titleLabel.frame.size.height + 30;
        make.height.equalTo(buttonH);
    }];

    //强制更新
    [showTextButton layoutIfNeeded];
    
    //计算当前cell的高度
    CGFloat buttonH = CGRectGetMaxY(showTextButton.frame);
    CGFloat iconH = CGRectGetMaxY(showIconView.frame);
    self.message.cellHeight = MAX(buttonH, iconH) + 10;
    
}

















@end
