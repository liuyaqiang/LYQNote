//
//  LYQVMTestVM.h
//  LYQNote
//
//  Created by 刘亚强 on 16/9/12.
//  Copyright © 2016年 liuyaqiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetWorking.h"
@interface LYQVMTestVM : NSObject<UITableViewDataSource>
// 请求命令
@property (nonatomic, strong, readonly) RACCommand *reuqesCommand;

//模型数组
@property (nonatomic, strong) NSArray *models;

@end
