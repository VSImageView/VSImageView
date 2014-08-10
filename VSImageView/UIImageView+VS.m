//
//  UIImageView+GH.m
//  VSImageView
//
//  Created by 杨进鹏 on 14-7-23.
//  Copyright (c) 2014年 viplux. All rights reserved.
//

#import "UIImageView+VS.h"
#import "UIImageView+WebCache.h"
#import "GHImageViewProgressView.h"
#import "SDImageCache.h"

@implementation UIImageView (VS)

- (void)setImageUrl:(NSURL *)imageUrl placeHolderImage:(UIImage *)placeHolderImage
{
    GHImageViewProgressView *pView = [[GHImageViewProgressView alloc] initWithFrame:self.bounds];
    pView.width = CGRectGetWidth(self.frame);
    pView.height = CGRectGetHeight(self.frame);
    [self addSubview:pView];
//    [self setImageWithURL:imageUrl placeholderImage:placeHolderImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
//        
//    }];
    [[SDImageCache sharedImageCache] clearDisk];
    [[SDImageCache sharedImageCache] cleanDisk];
    [[SDImageCache sharedImageCache] clearMemory];


    [self setImageWithURL:imageUrl placeholderImage:placeHolderImage options:SDWebImageRetryFailed progress:^(NSUInteger receivedSize, long long expectedSize) {
        [pView updateProgress:receivedSize / expectedSize];
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
        NSLog(@"complete");
        [pView updateProgress:1];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [pView removeFromSuperview];
        });
    }];
//    [self pregress];
}


- (void)pregress
{
//    []
}

@end
