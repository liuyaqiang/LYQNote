//
//  LYQReactiveUniversalUseViewController.m
//  LYQNote
//
//  Created by 刘亚强 on 16/9/6.
//  Copyright © 2016年 liuyaqiang. All rights reserved.
//

#import "LYQReactiveUniversalUseViewController.h"

@interface LYQReactiveUniversalUseViewController ()

@end

@implementation LYQReactiveUniversalUseViewController
- (IBAction)textFiled:(UITextField *)sender {
    self.center = sender.text;
}
- (IBAction)button:(UIButton *)sender {
    [self btnClick:sender];
}
- (void)btnClick:(UIButton *)button
{
    [self.view endEditing:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


@end
