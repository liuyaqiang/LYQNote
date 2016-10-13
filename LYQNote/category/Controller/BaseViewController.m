//
//  BaseViewController.m
//  LYQNote
//
//  Created by 刘亚强 on 16/8/30.
//  Copyright © 2016年 liuyaqiang. All rights reserved.
//

#import "BaseViewController.h"
#import "ViewController.h"
@interface BaseViewController ()

@end

@implementation BaseViewController
+ (BaseViewController *)pushToVctlFromCurrentCtl:(UIViewController *)currentCtl toCtlBlcok:(void (^)(UIViewController *))block
{
    
    BaseViewController *ctl = [[self alloc]init];
    [currentCtl.navigationController pushViewController:ctl animated:YES];
    if (block) {
        block(ctl);
    }
    return ctl;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationController.navigationBar.translucent = NO;
}



@end
