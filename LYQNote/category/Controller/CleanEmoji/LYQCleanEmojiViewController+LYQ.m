//
//  LYQCleanEmojiViewController+LYQ.m
//  LYQNote
//
//  Created by liuyaqiang on 2016/12/27.
//  Copyright © 2016年 liuyaqiang. All rights reserved.
//

#import "LYQCleanEmojiViewController+LYQ.h"

@implementation LYQCleanEmojiViewController (LYQ)
void exchangeMethod(Class class, SEL oSEL, SEL nSEL)
{
    Method oMethod = class_getInstanceMethod(class, oSEL);
    Method nMethod = class_getInstanceMethod(class, nSEL);

    // 验证当前实例是否实现originalSEL,避免返回父类SEL
    BOOL ok = class_addMethod(class, oSEL, method_getImplementation(nMethod), method_getTypeEncoding(nMethod));
    if (ok) {
        class_replaceMethod(class, nSEL, method_getImplementation(oMethod), method_getTypeEncoding(oMethod));
    } else {
        method_exchangeImplementations(oMethod, nMethod);
    }
}
+ (void)load
{
    exchangeMethod([self class], @selector(viewWillAppear:), @selector(my_viewWillAppear));
}
- (void)my_viewWillAppear
{
    NSLog(@"123412");
}
@end
