//
//  XTChatViewController.m
//  聊天
//
//  Created by ZhengXiangteng on 16/4/1.
//  Copyright © 2016年 前辈丶. All rights reserved.
//

#import "XTChatViewController.h"
#import "XTMessageCell.h"
#import "XTMessage.h"

@interface XTChatViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;

/** 存放聊天信息的数组 */
@property (nonatomic, strong) NSArray *messageArr;

@end

@implementation XTChatViewController

- (NSArray *)messageArr{
    if (!_messageArr) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"messages.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *mutArr = [NSMutableArray array];
        XTMessage *lastMessage = [XTMessage new];
        for (NSDictionary *dic in array) {
            XTMessage *message = [XTMessage messageWithDic:dic];
            //如果相邻两条数据中时间相同的话隐藏时间戳
            if ([message.time isEqualToString:lastMessage.time]) {
                message.hiddeTime = YES;
            }
            [mutArr addObject:message];
            lastMessage = message;
        }
       _messageArr = [mutArr mutableCopy];
    }
    return _messageArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"3630俱乐部";
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Main_WIDTH, Main_HEIGHT) style:1];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
    
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, Main_HEIGHT - 50, Main_WIDTH, 50)];
    bottomView.backgroundColor = [UIColor whiteColor];
    
    UITextField *field = [[UITextField alloc]initWithFrame:CGRectMake(5, 5, Main_WIDTH - 80, 40)];
    field.background = [UIImage imageNamed:@"chat_bottom_textfield"];
    
    UIButton *button = [[UIButton alloc]init];
    button.frame = CGRectMake(Main_WIDTH - 70, 7.5, 60, 35);
    [button setTitle:@"发送" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blueColor];
    [self.view addSubview:bottomView];
    [bottomView addSubview:field];
    [bottomView addSubview:button];
    // 监听键盘通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}
#pragma mark - 键盘处理
- (void)keyboardWillChangeFrame:(NSNotification *)note {
    // 取出键盘最终的frame
    CGRect rect = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    // 取出键盘弹出需要花费的时间
    double duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    // 修改transform
    [UIView animateWithDuration:duration animations:^{
        CGFloat ty = [UIScreen mainScreen].bounds.size.height - rect.origin.y;
        self.view.transform = CGAffineTransformMakeTranslation(0, - ty);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.messageArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XTMessageCell *cell = [XTMessageCell cellWithTableView:tableView];
    cell.message = self.messageArr[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    XTMessage *message = self.messageArr[indexPath.row];
    
    return message.cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    // 退出键盘
    //    [self.messageField resignFirstResponder];
    //    [self.messageField endEditing:YES];
    [self.view endEditing:YES];
}
@end
