//
//  CommentsController.m
//  评论
//
//  Created by ZhengXiangteng on 16/4/5.
//  Copyright © 2016年 前辈丶. All rights reserved.
//
#define Main_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define Main_WIDTH [[UIScreen mainScreen] bounds].size.width

#import "CommentsController.h"
#import "CommentsCell.h"
#import "ZLPhotoPickerBrowserViewController.h"

@interface CommentsController ()<UITableViewDelegate,UITableViewDataSource,CommentsCellDelegate>
@property (nonatomic,strong)UITableView *tableView;
/** 数据源数组 */
@property (nonatomic, strong) NSMutableArray *array;
@end

@implementation CommentsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"评论";

    Comment *comment = [[Comment alloc]init];
    comment.avatar = @"http://img1.gtimg.com/cq/pics/hv1/88/83/867/56397928.jpg";
    comment.nickname = @"我爱海钓";
    comment.createtime = @"2016年04月15日";
    comment.content = @"这次海钓简直不要太愉快,不仅认识了许多朋友,还学习到了很多东西,希望下一次也能这么愉快,3630海钓俱乐部棒棒哒!!!";
    comment.toContent = @"谢谢,祝您生活开心";
    comment.url = @[@"http://i0.hexunimg.cn/2013-05-17/154217630.jpg",
                    @"http://img1.gtimg.com/cq/pics/hv1/88/83/867/56397928.jpg",
                    @"http://m.tuniucdn.com/filebroker/cdn/vnd/b6/e1/b6e1c7deb567962d6b18a40b12866800_w320_h240_c1_t0.jpg",@"http://g3.hexunimg.cn/2014-07-20/166798662.jpg",
                    @"http://www.ts-event.com/bbx/upimages/20150127134849756.png",
                    @"http://e.hiphotos.baidu.com/bainuo/wh%3D720%2C436/sign=28ecabfecbfcc3ceb495c134a075fabc/37d12f2eb9389b50203ec78e8635e5dde6116e2c.jpg",@"http://img.ph.126.net/GFPJjNeO5rCSbKovd3fnuA==/612771024316067214.jpg",
                    @"http://img1.gtimg.com/house_zhuhai/pics/hv1/53/31/1232/80118758.jpg",
                    @"http://www.cnsearunner.com/newspic/news62pic2.jpg"];
    
    Comment *comment1 = [[Comment alloc]init];
    comment1.avatar = @"http://i0.hexunimg.cn/2013-05-17/154217630.jpg";
    comment1.nickname = @"小白";
    comment1.createtime = @"2016年04月05日";
    comment1.content = @"总体是一次比较愉快的旅行。酒店和去年的铂尔曼相比，还是差了一点。尤其是服务差了很多。当然价格也相对便宜，有简易厨房很方便。离百花谷商业中心大约步行20分钟，在这里吃饭价格并不便宜，大约是在上海双倍价格还多，但比酒店还是便宜，在亚龙湾能有个吃饭的地方也不错了。今年驴妈妈提供的上海机场接送真心不错。回程凌晨两点到达，车已经在等待，车也很好好，又碰巧没有和其他人拼车，显得性价比很高。";
    comment1.toContent = @"生活愉快";
    comment1.url = @[@"http://www.ts-event.com/bbx/upimages/20150127134849756.png",
                     @"http://e.hiphotos.baidu.com/bainuo/wh%3D720%2C436/sign=28ecabfecbfcc3ceb495c134a075fabc/37d12f2eb9389b50203ec78e8635e5dde6116e2c.jpg",@"http://img.ph.126.net/GFPJjNeO5rCSbKovd3fnuA==/612771024316067214.jpg"];
    
    Comment *comment2 = [[Comment alloc]init];
    comment2.avatar = @"";
    comment2.nickname = @"可可";
    comment2.createtime = @"2016年04月05日";
    comment2.content = @"酒店非常不错，有私家沙滩，订的是山景套房，房间内有阳台还有厨房，洗衣机微波炉，冰箱，可以自己做饭，和孩子玩得很愉快！ ";
    comment2.toContent = @"";
    comment2.url = @[
                     @"http://img1.gtimg.com/house_zhuhai/pics/hv1/53/31/1232/80118758.jpg",
                     @"http://www.cnsearunner.com/newspic/news62pic2.jpg"];
    
    Comment *comment3 = [[Comment alloc]init];
    comment3.avatar = @"http://www.popoho.com/d/file/2016-03-29/98bf4896d256b87308ce7228bff9ac67.jpg";
    comment3.nickname = @"现代感";
    comment3.createtime = @"2016年04月05日";
    comment3.content = @"真心不错,";
    comment3.toContent = @"下次大家一起玩";
    comment3.url = @[@"http://www.fansimg.com/uploads2009/08/userid44911time20090816152436.jpg"];
    
    Comment *comment4 = [[Comment alloc]init];
    comment4.avatar = @"";
    comment4.nickname = @"Tom";
    comment4.createtime = @"2016年04月15日";
    comment4.content = @"酒店不错，服务员超级亲切，态度真的很好，唯一觉得还可以改进的就是酒店自助，不过我打听下来，周围更多酒店自助晚餐都没有三文鱼什么的，所以性价比在亚龙湾还算可以了。儿童乐园也很棒，可以带小朋友打发时间";
    comment4.toContent = @"";
    comment4.url = @[];

//    Comment *comment5 = [[Comment alloc]init];
//    comment5.avatar = @"";
//    comment5.nickname = @"太有现代感了";
//    comment5.createtime = @"2016年04月15日";
//    comment5.content = @"太有现代感了太有现代感了太有现代感了太有现代感了太有现代感了";
//    comment5.toContent = @"卡阿斯蒂芬";
//    comment5.url = @[];
//
//    Comment *comment6 = [[Comment alloc]init];
//    comment6.avatar = @"";
//    comment6.nickname = @"太有现代感了";
//    comment6.createtime = @"2016年04月25日";
//    comment6.content = @"太有现代感了太有现代感了太有现代感了太有现代感了太有现代感了";
//    comment6.toContent = @"";
//    comment6.url = @[];

    self.array = [NSMutableArray array];
    [self.array addObject:comment];
    [self.array addObject:comment1];
    [self.array addObject:comment2];
    [self.array addObject:comment3];
    [self.array addObject:comment4];
//    [self.array addObject:comment5];
//    [self.array addObject:comment6];
//    
    [self initTabelView];

}
- (void)initTabelView{
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Main_WIDTH, Main_HEIGHT) style:UITableViewStylePlain];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    [self.view addSubview:self.tableView];
    
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CommentsCell *cell = [CommentsCell cellWithTableView:tableView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    Comment *comment = self.array[indexPath.row];
    cell.comment = comment;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Comment *comment = self.array[indexPath.row];
    
    NSLog(@"%f",comment.cellHight);
    
    return comment.cellHight;
    
}

/**
 * 返回每一行的估计高度
 * 只要返回了估计高度，那么就会先调用tableView:cellForRowAtIndexPath:方法创建cell，再调用tableView:heightForRowAtIndexPath:方法获取cell的真实高度
 */

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300;
}

#pragma mark -- TableViewCell Delegate 点击照片放大--
- (void)commentsCellsearcimage:(UIButton *)button{

    UITableViewCell * cell = (UITableViewCell *)[[[button superview] superview]superview];
    NSIndexPath * path = [self.tableView indexPathForCell:cell];
    Comment *comment = self.array[path.row];
    
    
    NSMutableArray * bigImgArray = [NSMutableArray new];
    for (int i = 0; i < comment.url.count; i++) {
        ZLPhotoPickerBrowserPhoto *photo = [[ZLPhotoPickerBrowserPhoto alloc] init];
        photo.photoURL = [NSURL URLWithString:comment.url[i]];
        [bigImgArray addObject:photo];
    }
    // 图片游览器
    ZLPhotoPickerBrowserViewController *pickerBrowser = [[ZLPhotoPickerBrowserViewController alloc] init];
    // 淡入淡出效果
     pickerBrowser.status = UIViewAnimationAnimationStatusFade;
    // 数据源/delegate
//    pickerBrowser.editing = YES;
    pickerBrowser.photos = bigImgArray;
    // 能够删除
//    pickerBrowser.delegate = self;
    // 当前选中的值
    pickerBrowser.currentIndex = (int)(long)button.tag - 1000;
    // 展示控制器
    [pickerBrowser showPickerVc:self];
}


@end
