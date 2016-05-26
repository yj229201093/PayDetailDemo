//
//  ApplayForLoanDetailTableViewCell.h
//  PayDetailDemo
//
//  Created by GongHui_YJ on 15/10/29.
//  Copyright © 2015年 GongHui_YJ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ApplayForLoanModel;

@interface ApplayForLoanDetailTableViewCell : UITableViewCell

@property (strong, nonatomic) UIView *cellView;
@property (strong, nonatomic) UIImageView *iconImageView; // 图标
@property (strong, nonatomic) UIView *lineView; // 分割线
@property (strong, nonatomic) UILabel *titleLabel; // 标题
@property (strong, nonatomic) UILabel *remarkLabel; // 内容


+(CGFloat)calulatHeigh:(ApplayForLoanModel *)appModel;

- (void)setCellWithArray:(NSMutableArray *)appModelArryModel appModel:(ApplayForLoanModel *)appModel NSIndexPath:(NSIndexPath *)indexPath;

@end
