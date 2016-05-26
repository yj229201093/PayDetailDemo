//
//  PayDetailsCollectionViewCell.m
//  PayDetailDemo
//
//  Created by GongHui_YJ on 15/10/28.
//  Copyright © 2015年 GongHui_YJ. All rights reserved.
//

#import "PayDetailsCollectionViewCell.h"
#import "UIView+CustomFrame.h"
#import "UIColor+RandomColor.h"
// 屏幕的宽和高
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@implementation PayDetailsCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

/**
 *  创建布局
 */
- (void)createView
{
    self.contentView.backgroundColor = [UIColor whiteColor];
    // 头像
    self.avatarImageView  = [[UIImageView alloc] initWithFrame:CGRectMake(self.contentView.width / 2 - 25, 0, 50, 50)];
    self.avatarImageView.layer.masksToBounds = YES;
    self.avatarImageView.layer.cornerRadius = 25;
    self.avatarImageView.backgroundColor = [UIColor blueColor];
    [self.contentView addSubview:_avatarImageView];
    
    // 姓名
    self.userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.avatarImageView.y + self.avatarImageView.height + 10, self.contentView.width, 20)];
    self.userNameLabel.backgroundColor = [UIColor clearColor];
    self.userNameLabel.text = @"张三";
    self.userNameLabel.textAlignment = NSTextAlignmentCenter;
    self.userNameLabel.font = [UIFont systemFontOfSize:12];
    self.userNameLabel.textColor = [UIColor RGBColor:50 green:50 blue:50 alpha:1];
    [self.contentView addSubview:_userNameLabel];
    
    // 金额
    self.amountLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.userNameLabel.y + self.userNameLabel.height + 0, self.contentView.width, 20)];
    self.amountLabel.backgroundColor = [UIColor clearColor];
    self.amountLabel.text = @"1200";
    self.amountLabel.textAlignment = NSTextAlignmentCenter;
    self.amountLabel.font = [UIFont systemFontOfSize:12];
    self.amountLabel.textColor = [UIColor RGBColor:50 green:50 blue:50 alpha:1];
    [self.contentView addSubview:_amountLabel];
}


@end
