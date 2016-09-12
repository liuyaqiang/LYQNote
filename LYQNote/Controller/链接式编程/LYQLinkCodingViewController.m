//
//  LYQLinkCodingViewController.m
//  LYQNote
//
//  Created by 刘亚强 on 16/8/31.
//  Copyright © 2016年 liuyaqiang. All rights reserved.
//

#import "LYQLinkCodingViewController.h"

@interface LYQLinkCodingViewController ()

@end

@implementation LYQLinkCodingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (!self.title.length) {
        self.title = @"链接式编程";
    }
    
    [self example];
}

- (void)example
{
    int reult = [self makeCalculator:^(LYQLinkCodingCalculator *calculator) {
        calculator.add(1).add(3);
    }];
    NSLog(@"%@",@(reult));
}
- (int)makeCalculator:(void (^)(LYQLinkCodingCalculator *))makeCalculator
{
    LYQLinkCodingCalculator *calculator = [[LYQLinkCodingCalculator alloc]init];
    makeCalculator(calculator);
    return calculator.result;
}
@end
