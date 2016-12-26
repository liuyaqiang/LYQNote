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
}

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"LYQNote";
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationController.hidesBarsOnSwipe = YES;

    tableViewM = [[LYQTableViewModel alloc]init];
    tableViewM.DelegateSubject  = [RACSubject subject];
    [tableViewM.DelegateSubject subscribeNext:^(id x) {        
         [NSClassFromNoteSectionTitleEnum([x integerValue])pushToVctlFromCurrentCtl:self toCtlBlcok:^(UIViewController *toCtl) {
            toCtl.title = NSStringFromNoteSectionTitleEnum([x integerValue]);
        }];
    }];
    tableViewM.dataArr = self.dataArr;
    self.tableView.refreshControl = nil;
    [self.view addSubview:self.tableView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    self.view.backgroundColor = [UIColor blueColor];
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
        _dataArr = @[@[@(NoteSectionTitleEnumFunction)],
                     @[@(NoteSectionTitleEnumLinkCoding)],
                     @[@(NoteSectionTitleEnumTextColorMask)],
                     @[@(NoteSectionTitleEnumValueForKeyPath)],
                     @[@(NoteSectionTitleEnumRuntime)],
                     @[@(NoteSectionTitleEnumReactiveCocoa)],
                     @[@(NoteSectionTitleEnumCoreImg)],
                     @[@(NoteSectionTitleEnumCountDown)],
                     @[@(NoteSectionTitleEnumPaintCode)],
                     @[@(NoteSectionTitleEnumIQKeyboardManager)],
                     @[@(NoteSectionTitleEnumCleanEmoji)]
                     ];

    }
    return _dataArr;
}


@end
