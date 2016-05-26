//
//  ApplayForLoanDetailTableViewCell.m
//  PayDetailDemo
//
//  Created by GongHui_YJ on 15/10/29.
//  Copyright © 2015年 GongHui_YJ. All rights reserved.
//

#import "ApplayForLoanDetailTableViewCell.h"
#import "ApplayForLoanModel.h"
#import "UIView+CustomFrame.h"
#import "UIColor+RandomColor.h"

@implementation ApplayForLoanDetailTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView
{
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(15, 0, 1, 100 + 20)];
    self.lineView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_lineView];
    
    self.cellView = [[UIView alloc] initWithFrame:CGRectMake(self.lineView.x + self.lineView.width, 0, self.contentView.width - (self.lineView.x + self.lineView.width + 15), 64)];
    self.cellView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:_cellView];
    
    self.backgroundColor = [UIColor clearColor];
    self.iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, -5, 10, 10)];
    self.iconImageView.image = [UIImage imageNamed:@"liucheng_1"];
    [self.contentView addSubview:_iconImageView];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, self.cellView.width - 10, 20)];
    self.titleLabel.text = @"在线申请";
    self.titleLabel.font = [UIFont systemFontOfSize:17];
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.textColor = [UIColor RGBColor:50 green:50 blue:50 alpha:1];
    [self.cellView addSubview:_titleLabel];
    
    self.remarkLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, self.titleLabel.height + self.titleLabel.y + 10, self.cellView.width - 10, 20)];
    self.remarkLabel.backgroundColor = [UIColor whiteColor];
    self.remarkLabel.numberOfLines = 0;
    self.remarkLabel.text = @"您的申请资料已经提交,等待电话审核";
    self.remarkLabel.font = [UIFont systemFontOfSize:15];
    self.remarkLabel.textColor = [UIColor RGBColor:100 green:100 blue:100 alpha:1];
    [self.cellView addSubview:_remarkLabel];
}

+(CGFloat)calulatHeigh:(ApplayForLoanModel *)appModel{
    
    // 计算高度
    CGRect nameBounds = [appModel.name boundingRectWithSize:CGSizeMake(300, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:17] forKey:NSFontAttributeName] context:nil];
    
     CGRect decBounds = [appModel.dec boundingRectWithSize:CGSizeMake(300, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:15] forKey:NSFontAttributeName] context:nil];
    
    NSLog(@"++++%f", 10 + nameBounds.size.height + 10 + decBounds.size.height + 10);
    NSLog(@"---%f---%f", nameBounds.size.height, decBounds.size.height);
    return 10 + nameBounds.size.height + 10 + decBounds.size.height + 10;
}

- (void)setCellWithArray:(NSMutableArray *)appModelArryModel appModel:(ApplayForLoanModel *)appModel NSIndexPath:(NSIndexPath *)indexPath
{
    CGRect nameBounds = [appModel.name boundingRectWithSize:CGSizeMake(300, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:17] forKey:NSFontAttributeName] context:nil];
    self.titleLabel.frame = CGRectMake(10, 10, self.cellView.width - 10, nameBounds.size.height);
    
    // 计算活动内容Label高度
    CGRect decBounds = [appModel.dec boundingRectWithSize:    CGSizeMake(300, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:15] forKey:NSFontAttributeName] context:nil];
    self.remarkLabel.frame = CGRectMake(10, self.titleLabel.height + self.titleLabel.y + 10, self.cellView.width - 10, decBounds.size.height + 20);
    
    self.cellView.height = decBounds.size.height + 10 + nameBounds.size.height +10 +10 +20;
    
    self.remarkLabel.text = appModel.dec;
    self.titleLabel.text = appModel.name;
    
    
    if (appModelArryModel.count -1 == indexPath.section)
    {
        self.lineView.height = self.cellView.height;
        self.iconImageView.image = [UIImage imageNamed:@"liucheng"];
    }
    else
    {
        self.iconImageView.image = [UIImage imageNamed:@"liucheng_1"];
        self.lineView.height = self.cellView.height + 6;
    }
    
    
    
    NSLog(@"%f--%f", self.cellView.height, self.remarkLabel.height);
}


@end
