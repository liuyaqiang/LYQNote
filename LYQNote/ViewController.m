//
//  ViewController.m
//  LYQNote
//
//  Created by 刘亚强 on 16/8/30.
//  Copyright © 2016年 liuyaqiang. All rights reserved.
//

#import "ViewController.h"
#import "BaseViewController.h"
#import "LYQValueForKeyPathViewController.h"
#import "LYQTextColorMaskViewController.h"
#import "LYQFunctionCodingViewController.h"
#import "LYQLinkCodingViewController.h"
#import "LYQRuntimeViewController.h"
#import "LYQReactiveCocoaViewController.h"
#import "LYQCoreImgViewController.h"

//VM
#import "LYQTableViewModel.h"

@interface ViewController ()
{
    LYQValueForKeyPathViewController *vkpClt;
    LYQTableViewModel *tableViewM;
    NSString *functionStr, *linkCodingStr, *textColorMaskStr, *valueForKeyPathStr, *runtimeStr, *reactiveCocoaStr, *coreImgStr;
    
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSDictionary *titleDic;
@property (nonatomic, strong) NSArray *dataArr;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"LYQNote";
    self.view.backgroundColor = [UIColor lightGrayColor];
    tableViewM = [[LYQTableViewModel alloc]init];
    tableViewM.DelegateSubject  = [RACSubject subject];
    [tableViewM.DelegateSubject subscribeNext:^(id x) {
        [[(BaseViewController *)NSClassFromString(x) class] pushToVctlFromCurrentCtl:self toCtlBlcok:^(UIViewController *toCtl) {
            toCtl.title = [self.titleDic valueForKey:x];
        }];
    }];
    tableViewM.titleDic = self.titleDic;
    tableViewM.dataArr = self.dataArr;
    [self.view addSubview:self.tableView];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
 
}

#pragma mark - Get
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.delegate = tableViewM;
        _tableView.dataSource = tableViewM;
    }
    return _tableView;
}
- (NSArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = @[@[NSStringFromClass([LYQValueForKeyPathViewController class])],
                     @[NSStringFromClass([LYQTextColorMaskViewController class])],
                     @[NSStringFromClass([LYQRuntimeViewController class])],
                     @[NSStringFromClass([LYQFunctionCodingViewController class])],
                     @[NSStringFromClass([LYQLinkCodingViewController class])],
                     @[NSStringFromClass([LYQReactiveCocoaViewController class])],
                     @[NSStringFromClass([LYQCoreImgViewController class])]
                     ];

    }
    return _dataArr;
}
- (NSDictionary *)titleDic
{
    if (!_titleDic) {
        functionStr = @"函数式编程", linkCodingStr = @"链接式编程", textColorMaskStr = @"字体颜色覆盖", valueForKeyPathStr = @"valueForKeyPath", runtimeStr = @"runtime", reactiveCocoaStr = @"reactiveCocoa" ,coreImgStr = @"coreImg";
        _titleDic = @{
                      NSStringFromClass([LYQValueForKeyPathViewController class]) : valueForKeyPathStr,
                      NSStringFromClass([LYQTextColorMaskViewController class]) :textColorMaskStr,
                      NSStringFromClass([LYQRuntimeViewController class]) : runtimeStr,
                      NSStringFromClass([LYQFunctionCodingViewController class]) : functionStr,
                      NSStringFromClass([LYQLinkCodingViewController class]) : linkCodingStr,
                      NSStringFromClass([LYQReactiveCocoaViewController class]) : reactiveCocoaStr,
                      NSStringFromClass([LYQCoreImgViewController class]) : coreImgStr
                      };
    }
    return _titleDic;
}
@end
