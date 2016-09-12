//
//  LYQFunctionCodingCalculator.m
//  LYQNote
//
//  Created by 刘亚强 on 16/8/31.
//  Copyright © 2016年 liuyaqiang. All rights reserved.
//

#import "LYQFunctionCodingCalculator.h"

@implementation LYQFunctionCodingCalculator
- (LYQFunctionCodingCalculator *)calculator:(int (^)(int))calculator
{
    self.result = calculator(self.result);
    return self;
}
- (LYQFunctionCodingCalculator *)equal:(BOOL (^)(int))equal
{
    self.isEqual = equal(self.result);
    return self;
}
@end
