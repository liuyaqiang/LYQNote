//
//  LYQLinkCodingCalculator.h
//  LYQNote
//
//  Created by 刘亚强 on 16/8/31.
//  Copyright © 2016年 liuyaqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYQLinkCodingCalculator : NSObject
@property (nonatomic, assign) int result;
- (LYQLinkCodingCalculator *(^)(int))add;
@end
