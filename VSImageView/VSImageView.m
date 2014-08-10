//
//  VSImageView.m
//  VSImageView
//
//  Created by 杨进鹏 on 14/8/11.
//  Copyright (c) 2014年 viplux. All rights reserved.
//  

#import "VSImageView.h"
#import "UIImageView+WebCache.h"
#import "VSImageViewProgressView.h"

/**
 *  网络图片下载失败视图
 */
@interface VSImageErrorView : UIView

/**
 *  快速创建一个VSImageErrorView
 */
+ (instancetype)imageErrorViewWithFrame:(CGRect)frame;

@end

@implementation VSImageErrorView

+ (instancetype)imageErrorViewWithFrame:(CGRect)frame
{
    VSImageErrorView *ret = [[self alloc] initWithFrame:frame];
    return ret;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = VSColor(40, 40, 40);
        
        UILabel *errmsgLabel = [[UILabel alloc] initWithFrame:CGRectMake(0 , 10, frame.size.width, 30)];
        errmsgLabel.text = @"图片下载失败";
        errmsgLabel.textAlignment = NSTextAlignmentCenter;
        errmsgLabel.font = [UIFont systemFontOfSize:14];
        errmsgLabel.textColor = [UIColor whiteColor];
        [self addSubview:errmsgLabel];
    }
    return self;
}

@end

@implementation VSImageView
{
    // 网络图片地址
    NSString *_imageURL;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setImageUrl:(NSString *)imageUrl
{
    // 保存网络图片地址
    _imageURL = imageUrl;
    // 创建一个加载动画视图
    VSImageViewProgressView *pView = [[VSImageViewProgressView alloc] initWithFrame:self.bounds];
    pView.width = CGRectGetWidth(self.frame);
    pView.height = CGRectGetHeight(self.frame);
    [self addSubview:pView];

    [[SDImageCache sharedImageCache] clearDisk];
    [[SDImageCache sharedImageCache] cleanDisk];
    [[SDImageCache sharedImageCache] clearMemory];
    // 防止循环引用引发内存泄漏 创建一个self的临时引用
    __block UIView *tempView = self;
    // 使用SDWebImage下载图片
    [self setImageWithURL:VSURL(imageUrl) placeholderImage:kDefaultPlaceHolderImage options:SDWebImageRetryFailed progress:^(NSUInteger receivedSize, long long expectedSize) {
        [pView updateProgress:receivedSize / (CGFloat)expectedSize];
//        NSLog(@"progress %f", receivedSize / (CGFloat)expectedSize);
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
        if (error) { // 网络图片下载失败
            [pView removeFromSuperview];
            [tempView addSubview:[VSImageErrorView imageErrorViewWithFrame:tempView.bounds]];
        } else { // 图片下载成功
            [pView updateProgress:1.0];
            // 在0.1秒之后移出加载动画视图
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [pView removeFromSuperview];
            });
        }
    }];
}

- (void)setImageUrl:(NSString *)imageUrl animationType:(VSImageViewAnimationType)animationType
{
    
}

@end
