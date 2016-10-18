//
//  LYQCountDownViewController.m
//  LYQNote
//
//  Created by 刘亚强 on 2016/10/18.
//  Copyright © 2016年 liuyaqiang. All rights reserved.
//

#import "LYQCountDownViewController.h"
#import "UIButton+CountDown.h"

@interface LYQCountDownViewController ()

@end

@implementation LYQCountDownViewController
- (IBAction)countDownClick:(UIButton *)sender {
    [sender startWithTime:10 title:@"获取验证码" countDownTitle:@"s"  mainColor:[UIColor colorWithRed:84/255.0 green:180/255.0 blue:98/255.0 alpha:1.0f] countColor:[UIColor lightGrayColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
