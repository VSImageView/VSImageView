//
//  VSViewController.m
//  VSImageView
//
//  Created by 杨进鹏 on 14/8/10.
//  Copyright (c) 2014年 viplux. All rights reserved.
//

#import "VSViewController.h"
#import "UIImageView+VS.h"

@interface VSViewController ()

@end

@implementation VSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.frame = CGRectMake(10, 20, 100, 100);
    [imgView setImageUrl:[NSURL URLWithString:@"http://www.baidu.com/flasg.jpg"] placeHolderImage:nil];
    [self.view addSubview:imgView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
