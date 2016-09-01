//
//  MBProgressHUD+LYQ.m
//  LYQNote
//
//  Created by 刘亚强 on 16/9/1.
//  Copyright © 2016年 liuyaqiang. All rights reserved.
//

#import "MBProgressHUD+LYQ.h"

@implementation MBProgressHUD (LYQ)
+ (void)showHUD
{
    [MBProgressHUD showHUDAddedTo:MY_WINDOW animated:YES];
}
+ (void)hideHUD
{
    [MBProgressHUD hideHUDForView:MY_WINDOW animated:YES];
}
@end
