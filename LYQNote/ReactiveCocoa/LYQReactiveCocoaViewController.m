//
//  LYQReactiveCocoaViewController.m
//  LYQNote
//
//  Created by 刘亚强 on 16/9/1.
//  Copyright © 2016年 liuyaqiang. All rights reserved.
//

#import "LYQReactiveCocoaViewController.h"
#import "RACSignal.h"
#import "RACDisposable.h"
#import "RACSubscriber.h"
#import "LYQReactiveTableVM.h"

@interface LYQReactiveCocoaViewController ()
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) LYQReactiveTableVM *ReactiveTableVM;
@end

@implementation LYQReactiveCocoaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ReactiveTableVM = [[LYQReactiveTableVM alloc]init];
    [self.view addSubview:self.tableView];
}


#pragma mark - Get
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.delegate = self.ReactiveTableVM;
        _tableView.dataSource = self.ReactiveTableVM;

    }
    return _tableView;
}
@end