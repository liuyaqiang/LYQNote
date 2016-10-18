//
//  UIButton+CountDown.h
//  LYQNote
//
//  Created by 刘亚强 on 2016/10/18.
//  Copyright © 2016年 liuyaqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CountDown)
- (void)startWithTime:(NSInteger)timeLine title:(NSString *)title countDownTitle:(NSString *)subTitle mainColor:(UIColor *)mColor countColor:(UIColor *)color;
@end
