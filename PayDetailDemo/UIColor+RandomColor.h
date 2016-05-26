//
//  UIColor+RandomColor.h
//  WeiBo
//
//  Created by lanou3g on 15/6/19.
//  Copyright (c) 2015年 杨建. All rights reserved.
//

#import <UIKit/UIKit.h>
#define RGBA_COLOR(R, G, B, A) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:A]
#define RGB_COLOR(R, G, B) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:1.0f]

@interface UIColor (RandomColor)

#pragma mark - 随机颜色
+ (UIColor *)randomColor;

+ (UIColor *)RGBColor:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;


+ (UIColor *)colorWithHexString:(NSString *)color;

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;


@end
