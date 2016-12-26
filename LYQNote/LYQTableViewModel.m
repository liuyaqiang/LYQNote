//
//  LYQTableViewModel.m
//  LYQNote
//
//  Created by 刘亚强 on 16/8/31.
//  Copyright © 2016年 liuyaqiang. All rights reserved.
//

#import "LYQTableViewModel.h"
#import "LYQValueForKeyPathViewController.h"
#import "LYQTextColorMaskViewController.h"
#import "LYQFunctionCodingViewController.h"
#import "LYQLinkCodingViewController.h"
#import "LYQRuntimeViewController.h"
#import "LYQReactiveCocoaViewController.h"
#import "LYQCoreImgViewController.h"
#import "LYQCountDownViewController.h"
#import "LYQPaintCodeViewController.h"
#import "LYQIQKeyboardViewController.h"
#import "LYQCleanEmojiViewController.h"

@interface LYQTableViewModel()

@end

@implementation LYQTableViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
    
    }
    return self;
}

#pragma mark -
#pragma mark UITableViewDataSource/UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArr.count;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.0001f;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *rowArr = self.dataArr[section];
    return rowArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        cell.textLabel.font = [UIFont systemFontOfSize:16];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:16];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    [self customCellWithCell:cell IndexPath:indexPath];
    
    return cell;
}
//定制cell
- (void)customCellWithCell:(UITableViewCell *)cell IndexPath:(NSIndexPath *)indexPath
{
    NSArray *rowArr = self.dataArr[indexPath.section];
    NoteSectionTitleEnum title =[rowArr[indexPath.row] integerValue];
    NSString *text = NSStringFromNoteSectionTitleEnum(title);
    cell.textLabel.text = text;
    cell.detailTextLabel.text = NSStringFromClass(NSClassFromNoteSectionTitleEnum(title));
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self selectCellWithIndextPath:indexPath];
}
//选择cell
- (void)selectCellWithIndextPath:(NSIndexPath *)indexPath
{
    NSArray *rowArr = self.dataArr[indexPath.section];
    NoteSectionTitleEnum title =[rowArr[indexPath.row] integerValue];
    if (self.DelegateSubject) {
        // 有值，才需要通知
        [self.DelegateSubject sendNext:@(title)];
        
    }
}

NSString *NSStringFromNoteSectionTitleEnum(NoteSectionTitleEnum title)
{
    switch (title) {
        case NoteSectionTitleEnumFunction: {
            return @"函数式编程";

            break;
        }
        case NoteSectionTitleEnumLinkCoding: {
            return @"链接式编程";

            break;
        }
        case NoteSectionTitleEnumTextColorMask: {
            return @"颜色";

            break;
        }
        case NoteSectionTitleEnumValueForKeyPath: {
            return @"valueForKeyPath";

            break;
        }
        case NoteSectionTitleEnumRuntime: {
            return @"runtime";

            break;
        }
        case NoteSectionTitleEnumReactiveCocoa: {
            return @"reactiveCocoa";

            break;
        }
        case NoteSectionTitleEnumCoreImg: {
            return @"coreImg";

            break;
        }
        case NoteSectionTitleEnumCountDown:{
            return @"倒计时";
            break;
        }
        case NoteSectionTitleEnumPaintCode:{
            return @"PaintCode";
            break;
        }
        case NoteSectionTitleEnumIQKeyboardManager:{
            return @"QKeyboardManager";
            break;
        }
        case NoteSectionTitleEnumCleanEmoji:{
            return @"CleanEmoji";
            break;
        }
    }

}

Class NSClassFromNoteSectionTitleEnum(NoteSectionTitleEnum title)
{
    switch (title) {
        case NoteSectionTitleEnumFunction: {
            return [LYQFunctionCodingViewController class];

            break;
        }
        case NoteSectionTitleEnumLinkCoding: {
            return [LYQLinkCodingViewController class];

            break;
        }
        case NoteSectionTitleEnumTextColorMask: {
            return [LYQTextColorMaskViewController class];

            break;
        }
        case NoteSectionTitleEnumValueForKeyPath: {
            return [LYQValueForKeyPathViewController class];

            break;
        }
        case NoteSectionTitleEnumRuntime: {
            return [LYQRuntimeViewController class];

            break;
        }
        case NoteSectionTitleEnumReactiveCocoa: {
            return [LYQReactiveCocoaViewController class];

            break;
        }
        case NoteSectionTitleEnumCoreImg: {
            return [LYQCoreImgViewController class];

            break;
        }
        case NoteSectionTitleEnumCountDown:{
            return [LYQCountDownViewController class];
            break;
        }
        case NoteSectionTitleEnumPaintCode:{
            return [LYQPaintCodeViewController class];
            break;
        }
        case NoteSectionTitleEnumIQKeyboardManager:{
            return [LYQIQKeyboardViewController class];
            break;
        }
        case NoteSectionTitleEnumCleanEmoji:{
            return [LYQCleanEmojiViewController class];
            break;
        }
    }

}
@end
