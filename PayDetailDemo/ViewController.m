//
//  ViewController.m
//  PayDetailDemo
//
//  Created by GongHui_YJ on 15/10/28.
//  Copyright © 2015年 GongHui_YJ. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+RandomColor.h"
#import "UIView+CustomFrame.h"
#import "PayDetailsCollectionViewCell.h"
#import "ApplayForLoanDetailTableViewCell.h"
#import "UIColor+RandomColor.h"
#import "ApplayForLoanModel.h"


// 屏幕的宽和高
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDataSource, UITableViewDelegate>
{
    CGFloat viewH; // 视图高
    CGFloat viewSpacing; // 间距
    CGFloat viewX;
    CGFloat collectionNameViewH; //收款人视图高
    CGFloat collectionViewH; //collectionView高
}
@property (strong, nonatomic) UICollectionView *collectionNameCollectionView; // 收款人
@property (strong, nonatomic) UILabel *payStatusLabel; // 工资发放成功
@property (strong, nonatomic) UILabel *payAmountLabel; // 工人工资金额
@property (strong, nonatomic) UIImageView *avatarImageView; // 用户头像
@property (strong, nonatomic) UILabel *userNameLabel; // 用户名
@property (strong, nonatomic) UILabel *allCollectionNameLabel; // 全部人员
@property (strong, nonatomic) UILabel *reasonLabel; // 理由

@property (strong, nonatomic) UITableView *tableView; // 创建tableView

@property (strong, nonatomic) NSMutableArray *appArrayModel;

@end

@implementation ViewController

- (NSMutableArray *)appArrayModel
{
    if (_appArrayModel == nil)
    {
        _appArrayModel = [NSMutableArray array];
    }
    return _appArrayModel;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor RGBColor:149 green:149 blue:149 alpha:1];
    [self cerateTableView];
    
    ApplayForLoanModel *applayModel = [[ApplayForLoanModel alloc] init];
    
    for (int i = 0; i < 10; i++)
    {

            applayModel.name = @"张OS TableView的Cell高度自适应OS TableView的Cell高度自适应OS TableView的Cell高度自适应OS TableView的Cell高度自适应OS";
            applayModel.dec = @"IOS TableView的Cell高度自适应，UILabel自动换行适应IOS TableView的Cell高度自适应，UILabel自动换行适应IOS TableView的Cell高度自适应，UILabel自动换行适应IOS TableView的Cell高度自适应，UILabel自动换行适应IOS TableView的Cell高度自适应，UILabel自动换行适应IOS TableView的Cell高度自适应";
          [self.appArrayModel addObject:applayModel];
    }
    
    NSLog(@"++++%ld", (unsigned long)self.appArrayModel.count);
    
    
//    [self cerateUserDetailView];
//    [self createView];
}

/**
 *  创建tableView
 */
- (void)cerateTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight - 44 - 64 - 10) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
}

#pragma mark - tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"---%ld", (unsigned long)self.appArrayModel.count);
    return self.appArrayModel.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    [tableView registerClass:[ApplayForLoanDetailTableViewCell class] forCellReuseIdentifier:cellIdentifier];
    ApplayForLoanDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    ApplayForLoanModel *appModel = [self.appArrayModel objectAtIndex:indexPath.row];
    
    [cell setCellWithArray:self.appArrayModel appModel:appModel NSIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 这边 调用类方法
    return  [ApplayForLoanDetailTableViewCell calulatHeigh:[self.appArrayModel objectAtIndex:indexPath.row]];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}



#pragma mark - 工资详情页
/**
 *  创建用户详情试图
 */
- (void)cerateUserDetailView
{
    [self screenProportionHeight];
    
    // 工资发送状态
    UIView *payStateView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, viewH)];
    payStateView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:payStateView];
    
    // 类型
    UILabel *typeLabel = [[UILabel alloc] initWithFrame:CGRectMake(viewX, payStateView.height / 2 - 10 , 50, 20)];
    typeLabel.text = @"类型";
    typeLabel.font = [UIFont systemFontOfSize:17];
    typeLabel.textColor = [UIColor RGBColor:150 green:150 blue:150 alpha:1];
    [payStateView addSubview:typeLabel];
    
    // 工资发放成功
    self.payStatusLabel = [[UILabel alloc] initWithFrame:CGRectMake(typeLabel.x + typeLabel.width + 10, payStateView.height / 2 - 10, kScreenWidth - (typeLabel.x + typeLabel.width + 20), 19)];
    self.payStatusLabel.text = @"工资发放成功";
    self.payStatusLabel.textColor = [UIColor RGBColor:239 green:130 blue:46 alpha:1];
    self.payStatusLabel.font = [UIFont systemFontOfSize:17];
    [payStateView addSubview:_payStatusLabel];
    
    
    // 工资金额
    UIView *payAmountView = [[UIView alloc] initWithFrame:CGRectMake(0, payStateView.y + payStateView.height + viewSpacing, kScreenWidth, viewH)];
    payAmountView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:payAmountView];
    
    // 工资金额文本
    UILabel *amountLabel = [[UILabel alloc] initWithFrame:CGRectMake(viewX, payAmountView.height / 2 - 10 , 50, 20)];
    amountLabel.text = @"金额";
    amountLabel.font = [UIFont systemFontOfSize:17];
    amountLabel.textColor = [UIColor RGBColor:150 green:150 blue:150 alpha:1];
    [payAmountView addSubview:amountLabel];
    
    // 工资金额
    self.payAmountLabel = [[UILabel alloc] initWithFrame:CGRectMake(amountLabel.x + amountLabel.width + 10, payAmountView.height / 2 - 10, kScreenWidth - (amountLabel.x + amountLabel.height + 10), 20)];
    self.payAmountLabel.text = @"共计-12000元";
    self.payAmountLabel.textColor = [UIColor RGBColor:50 green:50 blue:50 alpha:1];
    self.payAmountLabel.font = [UIFont systemFontOfSize:17];
    [payAmountView addSubview:_payAmountLabel];
    
    
    // 付款人
    UIView *payDraweeView = [[UIView alloc] initWithFrame:CGRectMake(0, payAmountView.y + payAmountView.height + viewSpacing, kScreenWidth, viewH)];
    payDraweeView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:payDraweeView];
    
    // 付款人文本
    UILabel *payDraweeLabel = [[UILabel alloc] initWithFrame:CGRectMake(viewX, payDraweeView.height / 2 - 10, 50, 20)];
    payDraweeLabel.text = @"用户";
    payDraweeLabel.textColor = [UIColor RGBColor:150 green:150 blue:150 alpha:1];
    payDraweeLabel.font = [UIFont systemFontOfSize:17];
    [payDraweeView addSubview:payDraweeLabel];
    
    // 头像
    self.avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(payDraweeLabel.x + payDraweeLabel.width + 10, payDraweeView.height / 2 - 15, 30, 30)];
    self.avatarImageView.backgroundColor = [UIColor redColor];
    self.avatarImageView.layer.masksToBounds = YES;
    self.avatarImageView.layer.cornerRadius = 15;
    [payDraweeView addSubview:_avatarImageView];
    
    // 姓名
    self.userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.avatarImageView.x + self.avatarImageView.width + 10, payDraweeView.height / 2 - 10, kScreenWidth - (self.avatarImageView.x + self.avatarImageView.width + 10), 20)];
    self.userNameLabel.text = @"王五";
    self.userNameLabel.textColor = [UIColor RGBColor:50 green:50 blue:50 alpha:1];
    self.userNameLabel.font = [UIFont systemFontOfSize:17];
    [payDraweeView addSubview:_userNameLabel];
    
    // 理由
    UIView *reasonView = [[UIView alloc] initWithFrame:CGRectMake(0, payDraweeView.y + payDraweeView.height + viewSpacing, kScreenWidth, viewH)];
    reasonView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:reasonView];
    
    //理由文本
    UILabel *reasonTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(viewX, reasonView.height / 2 - 10, 50, 20)];
    reasonTextLabel.text = @"理由";
    reasonTextLabel.textColor = [UIColor RGBColor:150 green:150 blue:150 alpha:1];
    reasonTextLabel.font = [UIFont systemFontOfSize:17];
    [reasonView addSubview:reasonTextLabel];
    
    // 理由内容
    self.reasonLabel = [[UILabel alloc] initWithFrame:CGRectMake(reasonTextLabel.x + reasonTextLabel.width + 10, reasonView.height / 2 - 10, kScreenWidth - (reasonTextLabel.x + reasonTextLabel.width + 20), 20)];
    self.reasonLabel.text = @"发工资啦啦啦啦啦啦啦啦";
    self.reasonLabel.textColor = [UIColor RGBColor:50 green:50 blue:50 alpha:1];
    [reasonView addSubview:_reasonLabel];
}

#pragma mark - 工资\代发工资详情页
/**
 *  手机的高度
 */
- (void)screenProportionHeight
{
    
    if (kScreenHeight == 480)
    {
        viewH = 49;
        viewSpacing = 0.5;
        viewX = 20;
        collectionNameViewH = 215;
        collectionViewH = 150;
    }
    else if (kScreenHeight == 568)
    {
        viewH = 49;
        viewSpacing = 0.5;
        viewX = 20;
        collectionNameViewH = 280;
        collectionViewH = 215;
    }
    else if (kScreenHeight == 667 || kScreenHeight == 736)
    {
        viewH = 64;
        viewSpacing = 0.5;
        viewX = 20;
        collectionNameViewH = 280;
        collectionViewH = 215;

    }
}

/**
 *  创建布局
 */
- (void)createView
{
    [self screenProportionHeight];
    
    // 工资发送状态
    UIView *payStateView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, viewH)];
    payStateView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:payStateView];
    
    // 图片
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(viewX, payStateView.height / 2 - 10 , 19, 19)];
    imageView.image = [UIImage imageNamed:@"selected"];
    [payStateView addSubview:imageView];
    
    // 工资发放成功
    self.payStatusLabel = [[UILabel alloc] initWithFrame:CGRectMake(imageView.x + imageView.width + 20, payStateView.height / 2 - 10, kScreenWidth - (imageView.x + imageView.width + 20), 19)];
    self.payStatusLabel.text = @"工资发放成功";
    self.payStatusLabel.textColor = [UIColor RGBColor:239 green:130 blue:46 alpha:1];
    self.payStatusLabel.font = [UIFont systemFontOfSize:17];
    [payStateView addSubview:_payStatusLabel];
    
    
    // 工资金额
    UIView *payAmountView = [[UIView alloc] initWithFrame:CGRectMake(0, payStateView.y + payStateView.height + viewSpacing, kScreenWidth, viewH)];
    payAmountView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:payAmountView];
    
    // 工资金额文本
    UILabel *amountLabel = [[UILabel alloc] initWithFrame:CGRectMake(viewX, payAmountView.height / 2 - 10 , 80, 20)];
    amountLabel.text = @"工资金额";
    amountLabel.font = [UIFont systemFontOfSize:17];
    amountLabel.textColor = [UIColor RGBColor:150 green:150 blue:150 alpha:1];
    [payAmountView addSubview:amountLabel];
    
    // 工资金额
    self.payAmountLabel = [[UILabel alloc] initWithFrame:CGRectMake(amountLabel.x + amountLabel.width + 10, payAmountView.height / 2 - 10, kScreenWidth - (amountLabel.x + amountLabel.height + 10), 20)];
    self.payAmountLabel.text = @"共计-12000元";
    self.payAmountLabel.textColor = [UIColor RGBColor:50 green:50 blue:50 alpha:1];
    self.payAmountLabel.font = [UIFont systemFontOfSize:17];
    [payAmountView addSubview:_payAmountLabel];
    
    
    // 付款人
    UIView *payDraweeView = [[UIView alloc] initWithFrame:CGRectMake(0, payAmountView.y + payAmountView.height + viewSpacing, kScreenWidth, viewH)];
    payDraweeView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:payDraweeView];
    
    // 付款人文本
    UILabel *payDraweeLabel = [[UILabel alloc] initWithFrame:CGRectMake(viewX, payDraweeView.height / 2 - 10, 60, 20)];
    payDraweeLabel.text = @"付款人";
    payDraweeLabel.textColor = [UIColor RGBColor:150 green:150 blue:150 alpha:1];
    payDraweeLabel.font = [UIFont systemFontOfSize:17];
    [payDraweeView addSubview:payDraweeLabel];
    
    // 头像
    self.avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(payDraweeLabel.x + payDraweeLabel.width + 30, payDraweeView.height / 2 - 15, 30, 30)];
    self.avatarImageView.backgroundColor = [UIColor redColor];
    self.avatarImageView.layer.masksToBounds = YES;
    self.avatarImageView.layer.cornerRadius = 15;
    [payDraweeView addSubview:_avatarImageView];

    // 姓名
    self.userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.avatarImageView.x + self.avatarImageView.width + 10, payDraweeView.height / 2 - 10, kScreenWidth - (self.avatarImageView.x + self.avatarImageView.width + 10), 20)];
    self.userNameLabel.text = @"王五";
    self.userNameLabel.textColor = [UIColor RGBColor:50 green:50 blue:50 alpha:1];
    self.userNameLabel.font = [UIFont systemFontOfSize:17];
    [payDraweeView addSubview:_userNameLabel];

    // 收款姓名
    UIView *collectionNameView = [[UIView alloc] initWithFrame:CGRectMake(0, payDraweeView.y + payDraweeView.height + viewSpacing, kScreenWidth, collectionNameViewH)];
    collectionNameView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:collectionNameView];
    [self createHomeCollectionView:collectionNameView];
   
    // 理由
    UIView *reasonView = [[UIView alloc] initWithFrame:CGRectMake(0, collectionNameView.y + collectionNameView.height + viewSpacing, kScreenWidth, viewH)];
    reasonView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:reasonView];
    
    //理由文本
    UILabel *reasonTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(viewX, reasonView.height / 2 - 10, 50, 20)];
    reasonTextLabel.text = @"理由";
    reasonTextLabel.textColor = [UIColor RGBColor:150 green:150 blue:150 alpha:1];
    reasonTextLabel.font = [UIFont systemFontOfSize:17];
    [reasonView addSubview:reasonTextLabel];
    
    // 理由内容
    self.reasonLabel = [[UILabel alloc] initWithFrame:CGRectMake(reasonTextLabel.x + reasonTextLabel.width + 20, reasonView.height / 2 - 10, kScreenWidth - (reasonTextLabel.x + reasonTextLabel.width + 20), 20)];
    self.reasonLabel.text = @"发工资啦啦啦啦啦啦啦啦";
    self.reasonLabel.textColor = [UIColor RGBColor:50 green:50 blue:50 alpha:1];
    [reasonView addSubview:_reasonLabel];
    
}

/**
 *  创建collectionView
 */
- (void)createHomeCollectionView:(UIView *)collectionNameView
{
    // 收款姓名
    UILabel *collectionNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(viewX, 5, kScreenWidth, 20)];
    collectionNameLabel.text = @"收款姓名";
    collectionNameLabel.font = [UIFont systemFontOfSize:17];
    collectionNameLabel.textColor = [UIColor RGBColor:150 green:150 blue:150 alpha:1];
    [collectionNameView addSubview:collectionNameLabel];
    
    // 创建collectionView
    //初始化
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    self.collectionNameCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, collectionNameLabel.y + collectionNameLabel.height + 10, kScreenWidth, collectionViewH)collectionViewLayout:flowLayout];
    self.collectionNameCollectionView.backgroundColor = [UIColor whiteColor];
    //设置代理
        self.collectionNameCollectionView.delegate = self;
        self.collectionNameCollectionView.dataSource = self;
    [collectionNameView addSubview:self.collectionNameCollectionView];
    
    // 全部XX人
    UILabel *allCollectionNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(viewX, _collectionNameCollectionView.y + _collectionNameCollectionView.height + 5, kScreenWidth, 20)];
    allCollectionNameLabel.text = @"全部12人";
    allCollectionNameLabel.font = [UIFont systemFontOfSize:14];
    allCollectionNameLabel.textColor = [UIColor RGBColor:150 green:150 blue:150 alpha:1];
    [collectionNameView addSubview:allCollectionNameLabel];
    
    // 图标
    
    
    self.allCollectionNameLabel = allCollectionNameLabel;


}

#pragma mark - collectionDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"payCell";
    [collectionView registerClass:[PayDetailsCollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
    PayDetailsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    return cell;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 10, 0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake(kScreenWidth / 4.000001,  100);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 跳转到个人详情页
    NSLog(@"当前点击-%ld列-%ld行", indexPath.section, indexPath.item);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
