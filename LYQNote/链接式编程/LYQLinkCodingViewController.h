//
//  LYQLinkCodingViewController.h
//  LYQNote
//
//  Created by 刘亚强 on 16/8/31.
//  Copyright © 2016年 liuyaqiang. All rights reserved.
//

#import "BaseViewController.h"
#import "LYQLinkCodingCalculator.h"

@interface LYQLinkCodingViewController : BaseViewController
- (int)makeCalculator:(void (^)(LYQLinkCodingCalculator *))makeCalculator;
@end
