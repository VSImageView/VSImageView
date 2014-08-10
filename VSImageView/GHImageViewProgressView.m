//
//  GHImageViewProgressView.m
//  VSImageView
//
//  Created by 杨进鹏 on 14-7-24.
//  Copyright (c) 2014年 viplux. All rights reserved.
//  图片下载进度展示视图

#import "GHImageViewProgressView.h"

#define VSColor(r, g, b) [UIColor colorWithRed:(r) / 255.0 green:(r) / 255.0 blue:(r) / 255.0 alpha:1.0]
#define VSColorWithAlpha(r, g, b, a) [UIColor colorWithRed:(r) / 255.0 green:(r) / 255.0 blue:(r) / 255.0 alpha:a]
#define VSAngle2Radian(angle) ((M_PI / 180.0) * angle)

@implementation GHImageViewProgressView
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
    wh -= 10;
    CGContextRef context = UIGraphicsGetCurrentContext();
   // CGContextAddRect(context, CGRectMake(0, 0, wh, wh));
    
    // 先画背景圆
    [VSColorWithAlpha(0, 0, 0, 0.6) setFill];
    CGContextAddEllipseInRect(context, CGRectMake(5, 10, wh, wh));
    CGContextDrawPath(context, kCGPathFill);
    
    // 中间的白色圆环
    [[UIColor whiteColor] setStroke];
    CGContextSetLineWidth(context, 2);
    CGContextAddEllipseInRect(context, CGRectMake(9, 14, wh - 8, wh - 8));
    CGContextDrawPath(context, kCGPathStroke);
    
    // 中间的扇形
    CGPoint center = CGPointMake((wh + 10) * 0.5, (wh + 19.5) * 0.5);
    CGContextMoveToPoint(context, center.x, center.y);
    [[UIColor whiteColor] setFill];
//    CGContextAddEllipseInRect(context, CGRectMake(11.5, 16.5, wh - 13, wh - 13));
    CGFloat radius = 63.5;//(wh - 26) * 0.5;
    CGFloat x = center.x;//(wh + 5) * 0.5;//radius * 2 - 11.5;
    CGFloat y = center.y;//(wh + 10) * 0.5;//radius * 2 - 16.5;
    
    CGFloat startAngel = 0;
    CGFloat angel = (_pregress <= 0 ? 0.01 : _pregress) * 360;
    CGFloat endAngel = startAngel + VSAngle2Radian(angel);
    CGContextAddArc(context, x, y, radius, startAngel, endAngel, 0);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFill);

//    wh -= 16;
//    [VSColorWithAlpha(30, 30, 30, 0.7) setStroke];
//    CGContextSetLineWidth(context, 15);
//    CGContextAddEllipseInRect(context, CGRectMake(5, 5, wh, wh));
//    CGContextDrawPath(context, kCGPathStroke);
}

- (void)dealloc
{
    NSLog(@"GHImageViewProgressView dealloc");
}


@end
