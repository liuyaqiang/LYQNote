//
//  LYQFunctionCodingCalculator.h
//  LYQNote
//
//  Created by 刘亚强 on 16/8/31.
//  Copyright © 2016年 liuyaqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYQFunctionCodingCalculator : NSObject
@property (nonatomic, assign) BOOL isEqual;
@property (nonatomic, assign) int result;

- (LYQFunctionCodingCalculator *)calculator:(int (^)( int result))calculator;
- (LYQFunctionCodingCalculator *)equal:(BOOL (^) (int result))equal;
@end
