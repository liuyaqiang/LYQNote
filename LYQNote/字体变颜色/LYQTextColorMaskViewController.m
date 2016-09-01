//
//  LYQTextColorMaskViewController.m
//  LYQNote
//
//  Created by 刘亚强 on 16/8/30.
//  Copyright © 2016年 liuyaqiang. All rights reserved.
//

#import "LYQTextColorMaskViewController.h"

@interface LYQTextColorMaskViewController ()

@end

@implementation LYQTextColorMaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (!self.title.length) {
        self.title = @"颜色覆盖";
    }
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 80, 50)];
    bgView.backgroundColor = [UIColor redColor];
    [self.view addSubview:bgView];
    
    UILabel *fla = [[UILabel alloc]initWithFrame:CGRectMake(100,100,200, 50)];
    fla.text = @"Hello,word";
    fla.font = [UIFont systemFontOfSize:30];
    fla.textColor = [UIColor redColor];
    fla.backgroundColor = [UIColor clearColor];
    [self.view addSubview:fla];
    
    UILabel *la = [[UILabel alloc]initWithFrame:CGRectMake(100,100,200, 50)];
    la.text = @"Hello,word";
    la.font = [UIFont systemFontOfSize:30];
    la.textColor = [UIColor whiteColor];
    la.backgroundColor = [UIColor clearColor];
    [self.view addSubview:la];
    
    CALayer *maskLayer = [CALayer new];;
    maskLayer.frame = CGRectMake(0, 0, 80, 50);
    maskLayer.backgroundColor = [UIColor whiteColor].CGColor;
    la.layer.mask = maskLayer;
}



@end
