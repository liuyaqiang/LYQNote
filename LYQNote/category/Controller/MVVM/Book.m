//
//  Book.m
//  LYQNote
//
//  Created by 刘亚强 on 16/9/12.
//  Copyright © 2016年 liuyaqiang. All rights reserved.
//

#import "Book.h"

@implementation Book
+ (instancetype)bookWithDict:(NSDictionary *)dic
{
    Book *book = [[Book alloc]init];    
    book.subtitle = [dic valueForKey:@"subtitle"];
    return book;
}

@end
