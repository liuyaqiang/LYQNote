//
//  LYQGlobalHeader.h
//  LYQNote
//
//  Created by 刘亚强 on 16/8/31.
//  Copyright © 2016年 liuyaqiang. All rights reserved.
//

#ifndef LYQGlobalHeader_h
#define LYQGlobalHeader_h
/**
 *  vendor header
 */
#import "AFNetworking.h"
#import "MBProgressHUD.h"
#import "ReactiveCocoa-umbrella.h"
#import "MJRefresh.h"
/**
 *  category header
 */
#import "MBProgressHUD+LYQ.h"


static inline BOOL isEmpty(id thing) {
    return thing == nil
    || [thing isKindOfClass:[NSNull class]]
    || ([thing respondsToSelector:@selector(length)]
        && [(NSData *)thing length] == 0)
    || ([thing respondsToSelector:@selector(count)]
        && [(NSArray *)thing count] == 0);
}

#endif /* LYQGlobalHeader_h */
