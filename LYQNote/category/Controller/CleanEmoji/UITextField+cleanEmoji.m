//
//  UITextField+cleanEmoji.m
//  LYQNote
//
//  Created by liuyaqiang on 2016/12/26.
//  Copyright © 2016年 liuyaqiang. All rights reserved.
//

#import "UITextField+cleanEmoji.h"
@interface EmojiDelegate : NSObject<UITextFieldDelegate>
@property(nonatomic, weak) UITextField *textField;
@property(nonatomic, weak) id<UITextFieldDelegate> originalDelegate;

@property(nonatomic, strong) NSString *prevText;    // 上次的输入结果

- (id) initWithTextField:(UITextField *)textField;
@end

@implementation EmojiDelegate

- (id) initWithTextField:(UITextField *)textField
{
    self = [super init];
    
    self.textField = textField;
    [textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    return self;
}

- (void) dealloc
{
    [_textField removeTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    self.originalDelegate = nil;
    self.prevText = nil;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if ([self.originalDelegate respondsToSelector:@selector(textFieldShouldBeginEditing:)]) {
        return [self.originalDelegate textFieldShouldBeginEditing:textField];
    }
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if ([self.originalDelegate respondsToSelector:@selector(textFieldDidBeginEditing:)]) {
        return [self.originalDelegate textFieldDidBeginEditing:textField];
    }
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    if ([self.originalDelegate respondsToSelector:@selector(textFieldShouldEndEditing:)]) {
        return [self.originalDelegate textFieldShouldEndEditing:textField];
    }
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([self.originalDelegate respondsToSelector:@selector(textFieldDidEndEditing:)]) {
        return [self.originalDelegate textFieldDidEndEditing:textField];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (string.length == 0) {
        return YES;
    }
    
    /// 过滤emoji
    
    // 忽略系统默认的emoji键盘
    if ([[[textField textInputMode] primaryLanguage] isEqualToString:@"emoji"]) {
        return NO;
    }
    
    // 验证string的emoji字符
    if ([string containEmoji]) {
        return NO;
    }
    
    if ([self.originalDelegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
        return [self.originalDelegate textField:textField shouldChangeCharactersInRange:range replacementString:string];
    }
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    if ([self.originalDelegate respondsToSelector:@selector(textFieldShouldClear:)]) {
        return [self.originalDelegate textFieldShouldClear:textField];
    }
    return NO;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([self.originalDelegate respondsToSelector:@selector(textFieldShouldReturn:)]) {
        return [self.originalDelegate textFieldShouldReturn:textField];
    }
    return NO;
}

/**
 * 监听UITextField文本变动,规避中文输入法联想输入Emoji问题
 */
- (void) textFieldDidChange:(UITextField *)textField
{
    if ([textField markedTextRange] == nil) {
        NSString *text = textField.text;
        if ([text containEmoji]) {
            textField.text = _prevText;
        } else {
            self.prevText = text;
        }
    }
}
@end
@implementation UITextField (cleanEmoji)
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

+ (void) load
{
    // setDelegate,拦截Delegate设置，默认走Emoji过滤
    exchangeMethod([self class], @selector(setDelegate:), @selector(emoji_setDelegate:));
    // getDelegate，返回业务代码设置的Delegate，确保set和get统一
    exchangeMethod([self class], @selector(delegate), @selector(emoji_delegate));
    // 几种初始化情况
    exchangeMethod([self class], @selector(init), @selector(emoji_init));
    exchangeMethod([self class], @selector(initWithFrame:), @selector(emoji_initWithFrame:));
    exchangeMethod([self class], @selector(initWithCoder:), @selector(emoji_initWithCoder:));
   }
- (id) emoji_init
{
    id ret = [self emoji_init];
    
    // 因为执行了函数指针替换，setDelegate会走emoji_setDelegate，这里调用setDelegate是为了确保没有设置delegate的业务代码同样过滤Emoji
    self.delegate = nil;
    
    return ret;
}

- (id) emoji_initWithFrame:(CGRect)frame
{
    id ret = [self emoji_initWithFrame:frame];
    
    self.delegate = nil;
    
    return ret;
}

- (id) emoji_initWithCoder:(NSCoder *)aDecoder
{
    id ret = [self emoji_initWithCoder:aDecoder];
    
    self.delegate = nil;
    
    return ret;
}

- (void) emoji_setDelegate:(id<UITextFieldDelegate>)delegate
{
    // 如果没有设置过delegate,需要设置内部代理的Delegate，否则让替换内部originalDelegate
    id<UITextFieldDelegate> del = [self emoji_delegate];
    if (!del) {
        EmojiDelegate *emojiDelegate = [[EmojiDelegate alloc] initWithTextField:self];
        emojiDelegate.originalDelegate = delegate;
        [self emoji_setDelegate:emojiDelegate];
    } else {
        EmojiDelegate *emojiDelegate = (EmojiDelegate *) del;
        emojiDelegate.originalDelegate = delegate;
    }
}

- (id<UITextFieldDelegate>) emoji_delegate
{
    return ((EmojiDelegate *)[self emoji_delegate]).originalDelegate;
}

- (void) emoji_dealloc
{
    // EmojiDelegate默认是retain的，需要手动释放一次资源
    [self emoji_setDelegate:nil];
}
@end
