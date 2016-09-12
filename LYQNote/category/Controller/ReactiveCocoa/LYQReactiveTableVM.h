//
//  LYQReactiveTableVM.h
//  LYQNote
//
//  Created by 刘亚强 on 16/9/1.
//  Copyright © 2016年 liuyaqiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ReactiveCocoa-umbrella.h"
#import "LYQReactiveUniversalUseViewController.h"
@interface LYQReactiveTableVM : NSObject<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *dataArr;
@property (nonatomic, strong) RACSubject *DelegateSubject;

@property (nonatomic, strong) LYQReactiveUniversalUseViewController *redV;

@end
