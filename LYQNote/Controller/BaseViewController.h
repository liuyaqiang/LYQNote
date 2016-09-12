//
//  BaseViewController.h
//  LYQNote
//
//  Created by 刘亚强 on 16/8/30.
//  Copyright © 2016年 liuyaqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYQGlobalHeader.h"

@interface BaseViewController : UIViewController
+ (BaseViewController *)pushToVctlFromCurrentCtl:(UIViewController *)CcurrentCtl toCtlBlcok:(void (^)(UIViewController * toCtl))block;

@end
