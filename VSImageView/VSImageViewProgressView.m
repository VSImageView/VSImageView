//
//  GHImageViewProgressView.m
//  VSImageView
//
//  Created by 杨进鹏 on 14-7-24.
//  Copyright (c) 2014年 viplux. All rights reserved.
//  图片下载进度展示视图

#import "VSImageViewProgressView.h"

#define VSAngle2Radian(angle) ((M_PI / 180.0) * angle)

@implementation VSImageViewProgressView

- (void)updateProgress:(CGFloat)progress
{
    
}

@end

@implementation VSImageViewProgressChartView
{
    CGFloat _pregress;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];// VSColorWithAlpha(0, 0, 0, 0.6);
        self.layer.cornerRadius = 5;
    }
    return self;
}

- (void)updateProgress:(CGFloat)progress
{
    _pregress = progress;
    if (progress <= 0) {
        return;
    }
    // 重新绘制
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    CGFloat wh = self.width > self.height ? self.height : self.width;

    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGFloat x = (self.frame.size.width - wh) * 0.5;
    CGFloat y = (self.frame.size.height - wh) * 0.5;
    // 先画背景圆
    [VSColorWithAlpha(0, 0, 0, 0.6) setFill];
    CGContextAddEllipseInRect(context, CGRectMake(x, y, wh, wh));
    CGContextDrawPath(context, kCGPathFill);
    
    // 中间的白色圆环
    // 线条宽度
    CGFloat circleLineW = 2;
    // 外圈距离边境距离
    CGFloat circleLineEdgeW = 2.7;
    CGFloat circleWH = wh - 2 * circleLineEdgeW;
    x = (self.frame.size.width - circleWH) * 0.5;
    y = (self.frame.size.height - circleWH) * 0.5;

    [[UIColor whiteColor] setStroke];
    CGContextSetLineWidth(context, circleLineW);
    CGContextAddEllipseInRect(context, CGRectMake(x, y, circleWH, circleWH));
    CGContextDrawPath(context, kCGPathStroke);
    
    // 标识进度的扇形
    CGPoint center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
    CGContextMoveToPoint(context, center.x, center.y);
    [[UIColor whiteColor] setFill];
    // 扇形距离外圈距离
    CGFloat chartMarginCircleW = 2.5;
    CGFloat radius = circleWH * 0.5 - chartMarginCircleW;//(wh - 26) * 0.5;
    x = center.x;//(wh + 5) * 0.5;//radius * 2 - 11.5;
    y = center.y;//(wh + 10) * 0.5;//radius * 2 - 16.5;
    
    CGFloat startAngel = 0;
    CGFloat angel = (_pregress <= 0 ? 0.01 : _pregress) * 360;
    CGFloat endAngel = startAngel + VSAngle2Radian(angel);
    CGContextAddArc(context, x, y, radius, startAngel, endAngel, 0);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFill);
}
@end

// 菊花宽高
#define kActivityWH 20.0f

@implementation VSImageViewProgressActivityView
{
    UIActivityIndicatorView *_activityView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        
        CGFloat x = (frame.size.width - kActivityWH) * 0.5;
        CGFloat y = (frame.size.height - kActivityWH) * 0.5;

        _activityView.frame = CGRectMake(x, y, kActivityWH, kActivityWH);
        [self addSubview:_activityView];
    }
    return self;
}

- (void)updateProgress:(CGFloat)progress
{
    if (progress == 1.0) {
        [_activityView stopAnimating];
    } else {
        [_activityView startAnimating];
    }
}

@end

@implementation VSImageViewProgressTextView

@end


