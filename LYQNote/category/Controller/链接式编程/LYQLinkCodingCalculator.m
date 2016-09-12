//
//  LYQLinkCodingCalculator.m
//  LYQNote
//
//  Created by 刘亚强 on 16/8/31.
//  Copyright © 2016年 liuyaqiang. All rights reserved.
//

#import "LYQLinkCodingCalculator.h"

@implementation LYQLinkCodingCalculator
- (LYQLinkCodingCalculator *(^)(int))add
{
    return ^LYQLinkCodingCalculator*(int value){
        self.result += value;
        return self;
    };
}
@end
