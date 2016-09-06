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
    NSString *text = rowArr[indexPath.row];
    cell.textLabel.text = self.titleDic[text];
    cell.detailTextLabel.text = text;
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
    NSString *text = rowArr[indexPath.row];
    if (self.DelegateSubject) {
        // 有值，才需要通知
        [self.DelegateSubject sendNext:text];
        
    }
}
@end
