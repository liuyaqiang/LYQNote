//
//  UITextField+cleanEmoji.m
//  LYQNote
//
//  Created by liuyaqiang on 2016/12/27.
//  Copyright © 2016年 liuyaqiang. All rights reserved.
//

#import "UITextField+cleanEmoji.h"
#import "NSString+cleanEmoji.h"
@implementation UITextField (cleanEmoji)
- (void)clearnEmoji
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textEntryDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
}
- (void)textEntryDidChange:(NSNotification *)noti
{
    UITextField *textField = [noti object];
    textField.text = textField.text.cleanEmoji;
}
@end
