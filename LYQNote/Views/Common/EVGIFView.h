//
//  EVGIFView.h
//  EVClub
//
//  Created by sam on 16/6/17.
//  Copyright © 2016年 EVClub. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EVGIFView : UIView

@property (nonatomic,strong) IBInspectable NSString *gifImageNamed;

/*
 * @brief initializer with imageNamed
 */
- (id)initWithImageNamed:(NSString *)imageNamed;
/*
 * @brief desingated initializer
 */
- (id)initWithCenter:(CGPoint)center fileURL:(NSURL*)fileURL;

/*
 * @brief start Gif Animation
 */
- (void)startGif;

/*
 * @brief stop Gif Animation
 */
- (void)stopGif;

/*
 * @brief get frames image(CGImageRef) in Gif
 */
+ (NSArray*)framesInGif:(NSURL*)fileURL;

@end
