//
//  LYQFunctionCodingViewController.m
//  LYQNote
//
//  Created by 刘亚强 on 16/8/31.
//  Copyright © 2016年 liuyaqiang. All rights reserved.
//

#import "LYQFunctionCodingViewController.h"
#import "LYQFunctionCodingCalculator.h"

@interface LYQFunctionCodingViewController ()

@end

@implementation LYQFunctionCodingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (!self.title.length) {
        self.title = @"函数式编程";
    }
    
    [self example];

}

- (void)example
{
    LYQFunctionCodingCalculator *calculator = [[LYQFunctionCodingCalculator alloc]init];
    [[calculator calculator:^int(int result) {
        return result += 3;
    }] equal:^BOOL(int result) {
        return result == 3;
    }];
    NSLog(@"%@  %@ ",@(calculator.isEqual),@(calculator.result));
}


@end
