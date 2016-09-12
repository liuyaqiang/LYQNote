//
//  LYQTableViewModel.h
//  LYQNote
//
//  Created by 刘亚强 on 16/8/31.
//  Copyright © 2016年 liuyaqiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ReactiveCocoa-umbrella.h"

typedef NS_ENUM(NSInteger,NoteSectionTitleEnum){
    NoteSectionTitleEnumFunction,
    NoteSectionTitleEnumLinkCoding,
    NoteSectionTitleEnumTextColorMask,
    NoteSectionTitleEnumValueForKeyPath,
    NoteSectionTitleEnumRuntime,
    NoteSectionTitleEnumReactiveCocoa,
    NoteSectionTitleEnumCoreImg
};

@interface LYQTableViewModel : NSObject<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray *dataArr;
@property (nonatomic, strong) RACSubject *DelegateSubject;

+ (NSString *)StringForTitleEnum:(NoteSectionTitleEnum) title;
+ (Class)ClassForTitleEnum:(NoteSectionTitleEnum) title;

@end
