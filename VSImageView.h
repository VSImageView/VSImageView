//
//  VSImageView.h
//  VSImageView
//
//  Created by 杨进鹏 on 14/8/11.
//  Copyright (c) 2014年 viplux. All rights reserved.
//  VSImageView封装了网络图片加载功能，使用SDWebimage下载图片。提供2种加载等待动画，图片家在失败重试功能

#import <UIKit/UIKit.h>
/*
 *  快速创建NSURL宏定义
 */
#define VSURL(urlString) ([NSURL URLWithString:urlString])
/*
 *  默认占位图片
 */
#define kDefaultPlaceHolderImage ([UIImage imageNamed:@"ph.jpg"])

/**
 *  下载图片过程等待动画类型枚举
 */
typedef enum {
    VSImageViewAnimationTypeChart, // 饼图
    VSImageViewAnimationTypeActivity, // 菊花
    VSImageViewAnimationTypeText // 文字模式
} VSImageViewAnimationType;

@interface VSImageView : UIImageView

/**
 *  设置图片url并下载
 *
 *  @param imageUrl 网络图片地址
 */
- (void)setImageUrl:(NSString *)imageUrl;
/**
 *  设置图片url并下载
 *
 *  @param imageUrl 网络图片地址
 *  @param animationType 网络图片下载过程中等待动画方式
 */
- (void)setImageUrl:(NSString *)imageUrl animationType:(VSImageViewAnimationType)animationType;
/**
 *  设置图片url并下载 下载完成之前使用占位图片显示
 *
 *  @param imageUrl 网络图片地址
 *  @param placeHolderImage 占位图片
 */
- (void)setImageUrl:(NSString *)imageUrl placeHolderImage:(UIImage *)placeHolderImage;

@end
