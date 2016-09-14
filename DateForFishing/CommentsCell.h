//
//  CommentsCell.h
//  评论
//
//  Created by ZhengXiangteng on 16/4/5.
//  Copyright © 2016年 前辈丶. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Comment.h"
@protocol CommentsCellDelegate <NSObject>

- (void)commentsCellsearcimage:(UIButton *)button;

@end

@interface CommentsCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

/** comment模型 */
@property (nonatomic, strong) Comment *comment;

@property (nonatomic, weak) id<CommentsCellDelegate> delegate;

@end
