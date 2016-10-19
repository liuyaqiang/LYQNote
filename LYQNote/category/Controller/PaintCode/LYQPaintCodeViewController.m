//
//  LYQPaintCodeViewController.m
//  LYQNote
//
//  Created by 刘亚强 on 2016/10/19.
//  Copyright © 2016年 liuyaqiang. All rights reserved.
//

#import "LYQPaintCodeViewController.h"

@interface LYQPaintCodeViewController ()
@property (nonatomic, strong)UIBezierPath *bezierPath;
@property (nonatomic, strong)UIView *launchView;
@end

@implementation LYQPaintCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customView];

}

- (void)customView
{
    self.launchView = [[UIView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:self.launchView];
    CAShapeLayer *layer = [[CAShapeLayer alloc]init];
    layer.path = self.bezierPath.CGPath;
    layer.bounds = CGPathGetPathBoundingBox(layer.path);
    
    self.view.backgroundColor = [UIColor blueColor];
    layer.position = CGPointMake(self.view.layer.bounds.size.width / 2, self.view.layer.bounds.size.height/ 2);
    layer.fillColor = [UIColor whiteColor].CGColor;
    [self.launchView.layer addSublayer:layer];
}
- (UIBezierPath *)bezierPath
{

    //// Color Declarations
    UIColor* strokeColor = [UIColor colorWithRed: 0.521 green: 0.521 blue: 0.521 alpha: 1];
        //// Path Drawing
        UIBezierPath* pathPath = [UIBezierPath bezierPath];
    _bezierPath = pathPath;
        [pathPath moveToPoint: CGPointMake(23.25, 14.29)];
        [pathPath addCurveToPoint: CGPointMake(62.29, 49.89) controlPoint1: CGPointMake(23.25, 14.29) controlPoint2: CGPointMake(46.88, 42.12)];
        [pathPath addCurveToPoint: CGPointMake(109.15, 72.43) controlPoint1: CGPointMake(74.26, 55.93) controlPoint2: CGPointMake(92.01, 67.13)];
        [pathPath addCurveToPoint: CGPointMake(153.17, 79.8) controlPoint1: CGPointMake(131.96, 79.48) controlPoint2: CGPointMake(153.17, 79.8)];
        [pathPath addCurveToPoint: CGPointMake(153.17, 49.89) controlPoint1: CGPointMake(153.17, 79.8) controlPoint2: CGPointMake(148.67, 60.03)];
        [pathPath addCurveToPoint: CGPointMake(162.57, 28.35) controlPoint1: CGPointMake(155.32, 45.04) controlPoint2: CGPointMake(157.36, 34.88)];
        [pathPath addCurveToPoint: CGPointMake(183.94, 10.38) controlPoint1: CGPointMake(171.32, 17.37) controlPoint2: CGPointMake(183.94, 10.38)];
        [pathPath addCurveToPoint: CGPointMake(204.59, 2.27) controlPoint1: CGPointMake(183.94, 10.38) controlPoint2: CGPointMake(193.12, 4.7)];
        [pathPath addCurveToPoint: CGPointMake(229.21, 2.27) controlPoint1: CGPointMake(213.32, 0.42) controlPoint2: CGPointMake(224.03, 1.51)];
        [pathPath addCurveToPoint: CGPointMake(261.98, 21.92) controlPoint1: CGPointMake(243.23, 4.35) controlPoint2: CGPointMake(261.98, 21.92)];
        [pathPath addLineToPoint: CGPointMake(301.7, 7.78)];
        [pathPath addCurveToPoint: CGPointMake(292.66, 24.91) controlPoint1: CGPointMake(301.7, 7.78) controlPoint2: CGPointMake(296.53, 19.86)];
        [pathPath addCurveToPoint: CGPointMake(277.47, 41.38) controlPoint1: CGPointMake(288.38, 30.5) controlPoint2: CGPointMake(277.47, 41.38)];
        [pathPath addLineToPoint: CGPointMake(311.09, 31.69)];
        [pathPath addLineToPoint: CGPointMake(280.29, 63.85)];
        [pathPath addCurveToPoint: CGPointMake(274.17, 114.3) controlPoint1: CGPointMake(280.29, 63.85) controlPoint2: CGPointMake(277.8, 98.76)];
        [pathPath addCurveToPoint: CGPointMake(258.65, 156.54) controlPoint1: CGPointMake(270.58, 129.66) controlPoint2: CGPointMake(258.65, 156.54)];
        [pathPath addCurveToPoint: CGPointMake(243.3, 183.67) controlPoint1: CGPointMake(258.65, 156.54) controlPoint2: CGPointMake(252.4, 170.78)];
        [pathPath addCurveToPoint: CGPointMake(226.21, 201.79) controlPoint1: CGPointMake(238.09, 191.05) controlPoint2: CGPointMake(230.57, 197.52)];
        [pathPath addCurveToPoint: CGPointMake(204.59, 222.17) controlPoint1: CGPointMake(219.59, 208.28) controlPoint2: CGPointMake(213.96, 215.87)];
        [pathPath addCurveToPoint: CGPointMake(177.04, 236.52) controlPoint1: CGPointMake(192.41, 230.37) controlPoint2: CGPointMake(177.04, 236.52)];
        [pathPath addCurveToPoint: CGPointMake(145.33, 247.87) controlPoint1: CGPointMake(177.04, 236.52) controlPoint2: CGPointMake(161.11, 243.5)];
        [pathPath addCurveToPoint: CGPointMake(121.25, 251.7) controlPoint1: CGPointMake(136.33, 250.37) controlPoint2: CGPointMake(127.8, 250.73)];
        [pathPath addCurveToPoint: CGPointMake(73.65, 251.7) controlPoint1: CGPointMake(104.82, 254.11) controlPoint2: CGPointMake(73.65, 251.7)];
        [pathPath addCurveToPoint: CGPointMake(40.1, 243.56) controlPoint1: CGPointMake(73.65, 251.7) controlPoint2: CGPointMake(51.15, 247.57)];
        [pathPath addCurveToPoint: CGPointMake(2.42, 225.88) controlPoint1: CGPointMake(27.41, 238.96) controlPoint2: CGPointMake(2.42, 225.88)];
        [pathPath addCurveToPoint: CGPointMake(45.5, 222.17) controlPoint1: CGPointMake(2.42, 225.88) controlPoint2: CGPointMake(31.41, 226.28)];
        [pathPath addCurveToPoint: CGPointMake(73.65, 213.11) controlPoint1: CGPointMake(52.04, 220.26) controlPoint2: CGPointMake(65.15, 217.26)];
        [pathPath addCurveToPoint: CGPointMake(94.65, 198.92) controlPoint1: CGPointMake(86.8, 206.7) controlPoint2: CGPointMake(94.65, 198.92)];
        [pathPath addCurveToPoint: CGPointMake(68.2, 193.09) controlPoint1: CGPointMake(94.65, 198.92) controlPoint2: CGPointMake(77.07, 198.92)];
        [pathPath addCurveToPoint: CGPointMake(49.08, 179.14) controlPoint1: CGPointMake(65.06, 191.02) controlPoint2: CGPointMake(54.1, 185.22)];
        [pathPath addCurveToPoint: CGPointMake(36.44, 155.02) controlPoint1: CGPointMake(39.92, 168.04) controlPoint2: CGPointMake(36.44, 155.02)];
        [pathPath addCurveToPoint: CGPointMake(49.08, 156.54) controlPoint1: CGPointMake(36.44, 155.02) controlPoint2: CGPointMake(44.61, 156.84)];
        [pathPath addCurveToPoint: CGPointMake(62.29, 153.27) controlPoint1: CGPointMake(53.23, 156.26) controlPoint2: CGPointMake(62.29, 153.27)];
        [pathPath addCurveToPoint: CGPointMake(32.76, 136.17) controlPoint1: CGPointMake(62.29, 153.27) controlPoint2: CGPointMake(41.16, 146.88)];
        [pathPath addCurveToPoint: CGPointMake(17.3, 114.3) controlPoint1: CGPointMake(29.46, 131.97) controlPoint2: CGPointMake(20.76, 122.84)];
        [pathPath addCurveToPoint: CGPointMake(13.2, 90.77) controlPoint1: CGPointMake(12.41, 102.25) controlPoint2: CGPointMake(13.2, 90.77)];
        [pathPath addLineToPoint: CGPointMake(40.1, 97.77)];
        [pathPath addCurveToPoint: CGPointMake(13.2, 56.86) controlPoint1: CGPointMake(40.1, 97.77) controlPoint2: CGPointMake(19.14, 84)];
        [pathPath addCurveToPoint: CGPointMake(23.25, 14.29) controlPoint1: CGPointMake(7.25, 29.72) controlPoint2: CGPointMake(23.25, 14.29)];
        [pathPath closePath];
        pathPath.miterLimit = 4;
        
        pathPath.usesEvenOddFillRule = YES;
        
        [strokeColor setStroke];
        pathPath.lineWidth = 1;
        [pathPath stroke];
   
    return _bezierPath;

}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    [UIView animateWithDuration:.2f animations:^{
        self.launchView.transform = CGAffineTransformMakeScale(0.2f, 0.2f);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:.5f animations:^{
            self.launchView.transform = CGAffineTransformMakeScale(6.f, 6.f);
        } completion:^(BOOL finished) {
            [self.launchView removeFromSuperview];
        }];
    }];
}
@end
