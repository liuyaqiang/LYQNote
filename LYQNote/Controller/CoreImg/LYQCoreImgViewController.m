//
//  LYQCoreImgViewController.m
//  LYQNote
//
//  Created by 刘亚强 on 16/9/6.
//  Copyright © 2016年 liuyaqiang. All rights reserved.
//

#import "LYQCoreImgViewController.h"


#import "UIImage+Filters.h"

@interface LYQCoreImgViewController ()
@property (nonatomic, strong) UIImage *originalImage;
@end

@implementation LYQCoreImgViewController
@synthesize myPhoto;
@synthesize originalImage = _originalImage;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.originalImage = self.myPhoto.image;
    
    NSArray *supportedFilters = [CIFilter filterNamesInCategory:kCICategoryBuiltIn];
    for (NSString *filter in supportedFilters){
        NSLog(@"%@", filter);
    }
}

- (void)viewDidUnload
{
    [self setOriginalImage:nil];
    [self setMyPhoto:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)applyFilter:(UIButton *)sender {
    
    NSString *buttonTitle = sender.titleLabel.text;
    
    if ([buttonTitle isEqualToString:@"Saturation"]) {
        self.myPhoto.image = [self.myPhoto.image saturateImage:1.8 withContrast:1.0];
    }
    
    if ([buttonTitle isEqualToString:@"B&W"]) {
        self.myPhoto.image = [self.myPhoto.image saturateImage:0 withContrast:1.05];
    }
    
    if ([buttonTitle isEqualToString:@"Vignette"]) {
        self.myPhoto.image = [self.myPhoto.image vignetteWithRadius:0 andIntensity:18];
    }
    
    if ([buttonTitle isEqualToString:@"Double"]){
        
        self.myPhoto.image = [self.myPhoto.image blendMode:@"CIScreenBlendMode" withImageNamed:@"flowers.jpg"];
    }
    
    if ([buttonTitle isEqualToString:@"Vintage"]) {
        self.myPhoto.image = [self.myPhoto.image blendMode:@"CISoftLightBlendMode" withImageNamed:@"paper.jpg"];
    }
    
    if ([buttonTitle isEqualToString:@"Curve"]) {
        self.myPhoto.image = [self.myPhoto.image curveFilter];
    }
    
    
}
- (IBAction)resetImage {
    [self.myPhoto setImage:self.originalImage];
    
}

@end
