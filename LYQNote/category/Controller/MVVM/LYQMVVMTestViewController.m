//
//  LYQMVVMTestViewController.m
//  LYQNote
//
//  Created by 刘亚强 on 16/9/12.
//  Copyright © 2016年 liuyaqiang. All rights reserved.
//

#import "LYQMVVMTestViewController.h"
#import "LYQVMTestVM.h"
@interface LYQMVVMTestViewController ()

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) LYQVMTestVM *requesViewModel;
@end

@implementation LYQMVVMTestViewController
/*
2.1 程序为什么要架构：便于程序员开发和维护代码。

2.2 常见的架构思想:

MVC M:模型 V:视图 C:控制器

MVVM M:模型 V:视图+控制器 VM:视图模型

MVCS M:模型 V:视图 C:控制器 C:服务类

VIPER V:视图 I:交互器 P:展示器 E:实体 R:路由
PS:VIPER架构思想

2.3 MVVM介绍

模型(M):保存视图数据。

视图+控制器(V):展示内容 + 如何展示

视图模型(VM):处理展示的业务逻辑，包括按钮的点击，数据的请求和解析等等。
*/


- (LYQVMTestVM *)requesViewModel
{
    if (_requesViewModel == nil) {
        _requesViewModel = [[LYQVMTestVM alloc] init];
    }
    return _requesViewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 创建tableView
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.dataSource = self.requesViewModel;
    
    [self.view addSubview:self.tableView];
    
    // 执行请求
    RACSignal *requesSiganl = [self.requesViewModel.reuqesCommand execute:nil];
    
    [[self.requesViewModel.reuqesCommand.executing skip:1] subscribeNext:^(id x) {
       
    }];
    // 获取请求的数据
    [requesSiganl subscribeNext:^(id x) {
        if ([x isKindOfClass:[NSError class]]) {
            
        }else{
            self.requesViewModel.models = x;
            [self.tableView reloadData];
        }
    }];
    
}
@end
