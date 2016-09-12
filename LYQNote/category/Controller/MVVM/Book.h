//
//  Book.h
//  LYQNote
//
//  Created by 刘亚强 on 16/9/12.
//  Copyright © 2016年 liuyaqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject
+ (instancetype)bookWithDict:(NSDictionary *)dic;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@end
