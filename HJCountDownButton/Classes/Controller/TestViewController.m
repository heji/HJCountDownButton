//
//  TestViewController.m
//  HJCountDownButton
//
//  Created by Jeffery He on 15/4/28.
//  Copyright (c) 2015年 Jeffery He. All rights reserved.
//

#import "TestViewController.h"
#import "HJCountDownButton.h"

@interface TestViewController () <HJCountDownButtonDelegate>

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HJCountDownButton *countDownButton = [HJCountDownButton buttonWithType:UIButtonTypeCustom];
    countDownButton.backgroundColor = [UIColor redColor];
    countDownButton.frame = CGRectMake(0, 0, 300.0f, 40.0f);
    countDownButton.center = self.view.center;
    [countDownButton setTitle:@"Get Verification Code" forState:UIControlStateNormal];
    countDownButton.delegate = self;
//    countDownButton.startTime = 10;
//    countDownButton.againTitle = @"重新获取";
//    countDownButton.leftSecondTitle = @"还剩 %ld 秒";
    [self.view addSubview:countDownButton];
}

#pragma mark - HJCountDownButtonDelegate
- (void)countDownButtonDidClick:(HJCountDownButton *)timeButton {
    // do something
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
