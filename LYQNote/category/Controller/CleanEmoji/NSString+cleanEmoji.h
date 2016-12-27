//
//  NSString+cleanEmoji.h
//  LYQNote
//
//  Created by liuyaqiang on 2016/12/26.
//  Copyright © 2016年 liuyaqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (cleanEmoji)
- (BOOL)isEmoji;
- (BOOL)containsEmoji;
- (NSString *)cleanEmoji;
@end
