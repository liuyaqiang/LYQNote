//
//  LYQVMTestVM.m
//  LYQNote
//
//  Created by 刘亚强 on 16/9/12.
//  Copyright © 2016年 liuyaqiang. All rights reserved.
//

#import "LYQVMTestVM.h"
#import "Book.h"
@implementation LYQVMTestVM
- (instancetype)init
{
    if (self = [super init]) {
        
        [self initialBind];
    }
    return self;
}


- (void)initialBind
{
    _reuqesCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        
        RACSignal *requestSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            
            
            NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
            parameters[@"q"] = @"基础";
            [[AFHTTPSessionManager manager] GET:@"https://api.douban.com/v2/book/search" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                NSLog(@"%@",responseObject);

                // 请求成功调用
                // 把数据用信号传递出去
                [subscriber sendNext:responseObject];

                [subscriber sendCompleted];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                // 把数据用信号传递出去
                [subscriber sendNext:error];
                
                [subscriber sendCompleted];
            }];

            return nil;
        }];
        // 在返回数据信号时，把数据中的字典映射成模型信号，传递出去
        return [requestSignal map:^id(id value) {
            if ([value isKindOfClass:[NSError class]]) {
                return value;
            }else{
                NSMutableArray *dictArr = value[@"books"];
                
                // 字典转模型，遍历字典中的所有元素，全部映射成模型，并且生成数组
                NSArray *modelArr = [[dictArr.rac_sequence map:^id(id value) {
                    return [Book bookWithDict:value];
                }] array];
                
                return modelArr;
            }
        }];
        

        
    }];
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    Book *book = self.models[indexPath.row];
    cell.detailTextLabel.text = book.subtitle;
    cell.textLabel.text = book.title;
    
    return cell;
}

@end
