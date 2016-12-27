//
//  LYQCleanEmojiViewController.m
//  LYQNote
//
//  Created by liuyaqiang on 2016/12/26.
//  Copyright © 2016年 liuyaqiang. All rights reserved.
//

#import "LYQCleanEmojiViewController.h"
#import "UITextField+cleanEmoji.h"
@interface LYQCleanEmojiViewController ()<UITextFieldDelegate>

@end

@implementation LYQCleanEmojiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 50, 300, 30)];
    textField.backgroundColor = [UIColor blueColor];
//    textField.delegate = self;
    [self.view addSubview:textField];
    [textField clearnEmoji];
}

@end
