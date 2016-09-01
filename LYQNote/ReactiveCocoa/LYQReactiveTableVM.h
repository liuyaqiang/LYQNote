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
@interface LYQReactiveTableVM : NSObject<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray *dataArr;

@property (nonatomic, strong) RACSignal *signal;
@property (nonatomic, strong) RACSubject *subject;
@property (nonatomic, strong) RACReplaySubject *replaySubject;
@property (nonatomic, strong) RACCommand *command;
@end
