//
//  LYQValueForKeyPathViewController.m
//  LYQNote
//
//  Created by 刘亚强 on 16/8/30.
//  Copyright © 2016年 liuyaqiang. All rights reserved.
//

#import "LYQValueForKeyPathViewController.h"

@interface LYQValueForKeyPathViewController ()

@end

@implementation LYQValueForKeyPathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ValueForKeyPath";
    
    NSDictionary *dic2 = @{
                           @"key1":@1,
                           @"key2":@2,
                           @"key3":@3,
                           @"key4":@4,
                           @"photos":@{
                                   @"photo":
                                       @{
                                           @"pic1":@6,
                                           @"pic2":@7
                                           },
                                   @"place":@{
                                           @"place1":@5,
                                           @"place2":@4
                                           }
                                   }
                           };
    NSDictionary *photos = [dic2 valueForKeyPath:@"photos.photo"];
    NSDictionary *places = [dic2 valueForKeyPath:@"photos.place"];
    NSNumber *name1 = [photos valueForKey:@"pic1"];
    NSNumber *age1 = [photos valueForKey:@"pic2"];
    NSNumber *name2 = [places valueForKey:@"place1"];
    NSNumber *age2 = [places valueForKey:@"place2"];
    
    NSLog(@"%@ ，%@ ，%@ ，%@ ，%@ ,%@",photos,places,name1,age1,name2,age2);
    
    NSArray *testArr = [NSArray arrayWithObjects:@"2.0",@"3.0",@"4.0",@"5.0", nil];
    NSNumber *sum = [testArr valueForKeyPath:@"@sum.floatValue"];
    NSNumber *avg = [testArr valueForKeyPath:@"@avg.floatValue"];
    NSNumber *max = [testArr valueForKeyPath:@"@max.floatValue"];
    NSNumber *min = [testArr valueForKeyPath:@"@min.floatValue"];
    NSLog(@"%@,%@,%@,%@",sum,avg,max,min);
}



@end
