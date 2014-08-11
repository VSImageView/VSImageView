//
//  GHImageViewProgressView.h
//  VSImageView
//
//  Created by 杨进鹏 on 14-7-24.
//  Copyright (c) 2014年 viplux. All rights reserved.
//  图片下载动画视图。三种动画均继承自VSImageViewProgressView 通过updateProgress方法来更新进度条


#import <UIKit/UIKit.h>

#define VSColor(r, g, b) [UIColor colorWithRed:(r) / 255.0 green:(r) / 255.0 blue:(r) / 255.0 alpha:1.0]
#define VSColorWithAlpha(r, g, b, a) [UIColor colorWithRed:(r) / 255.0 green:(r) / 255.0 blue:(r) / 255.0 alpha:a]

@interface VSImageViewProgressView : UIView

@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CGFloat height;

/**
 *  更新进度
 *
 *  @param progress 进度百分比
 */
- (void)updateProgress:(CGFloat)progress;

@end

/**
 *  图片下载动画视图饼图
 */
@interface VSImageViewProgressChartView : VSImageViewProgressView

@end

/**
 *  图片下载动画视图菊花
 */
@interface VSImageViewProgressActivityView : VSImageViewProgressView

@end

/**
 *  图片下载动画视图文字动画
 */
@interface VSImageViewProgressTextView : VSImageViewProgressView

@end

