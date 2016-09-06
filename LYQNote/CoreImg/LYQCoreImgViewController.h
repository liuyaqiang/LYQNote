//
//  LYQCoreImgViewController.h
//  LYQNote
//
//  Created by 刘亚强 on 16/9/6.
//  Copyright © 2016年 liuyaqiang. All rights reserved.
//

#import "BaseViewController.h"

@interface LYQCoreImgViewController : BaseViewController
- (IBAction)applyFilter:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *myPhoto;
- (IBAction)resetImage;
@end
