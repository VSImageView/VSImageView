//
//  GHImageViewProgressView.h
//  VSImageView
//
//  Created by 杨进鹏 on 14-7-24.
//  Copyright (c) 2014年 viplux. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GHImageViewProgressView : UIView

@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CGFloat height;

/**
 *  更新进度
 *
 *  @param progress 进度百分比
 */
- (void)updateProgress:(CGFloat)progress;

@end
