//
//  VSViewController.m
//  VSImageView
//
//  Created by 杨进鹏 on 14/8/10.
//  Copyright (c) 2014年 viplux. All rights reserved.
//

#import "VSViewController.h"
#import "VSImageView.h"

@interface VSViewController ()

@end

@implementation VSViewController
{
    VSImageView *_imgView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ph.jpg"]];
    
    _imgView = [[VSImageView alloc] init];
    _imgView.frame = CGRectMake(10, 30, 160, 160);
//    [_imgView setImageUrl:@"http://images-fast.digu.com/34bcdc5b7af548d59d7ac32ed04f0a450001.jpg"];
//    [_imgView setImageUrl:@"http://images-fast.digu.com/34bcdc5b7af548d59d7ac32ed04f0a450001.jpg"];
    [_imgView setImageUrl:@"http://images-fast.digu.com/34bcdc5b7af548d59d7ac32ed04f0a450001.jpg" animationType:VSImageViewAnimationTypeChart];
    [self.view addSubview:_imgView];
    
    //
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 300, 80, 30)];
    [btn setTitle:@"重新下载" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(reDownLoad) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
//    VSImageView *vsImageView = [[VSImageView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    
    
//    UIProgressView *progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
//    progressView.tintColor = [UIColor blueColor];
//    progressView.frame = CGRectMake(100, 300, 80, 80);
//    [self.view addSubview:progressView];
}

- (void)reDownLoad
{
    [_imgView setImageUrl:@"http://images-fast.digu.com/34bcdc5b7af548d59d7ac32ed04f0a450001.jpg" animationType:VSImageViewAnimationTypeChart];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
