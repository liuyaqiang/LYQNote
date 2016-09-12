//
//  EVGIFView.m
//  EVClub
//
//  Created by sam on 16/6/17.
//  Copyright © 2016年 EVClub. All rights reserved.
//

#import "EVGIFView.h"
#import <ImageIO/ImageIO.h>
#import <QuartzCore/CoreAnimation.h>

/*
 * @brief resolving gif information
 */
void getFrameInfo(CFURLRef url, NSMutableArray *frames, NSMutableArray *delayTimes, CGFloat *totalTime,CGFloat *gifWidth, CGFloat *gifHeight)
{
    CGImageSourceRef gifSource = CGImageSourceCreateWithURL(url, NULL);
    
    // get frame count
    size_t frameCount = CGImageSourceGetCount(gifSource);
    for (size_t i = 0; i < frameCount; ++i) {
        // get each frame
        CGImageRef frame = CGImageSourceCreateImageAtIndex(gifSource, i, NULL);
        [frames addObject:(__bridge id)frame];
        CGImageRelease(frame);
        
        // get gif info with each frame
        NSDictionary *dict = (NSDictionary*)CFBridgingRelease(CGImageSourceCopyPropertiesAtIndex(gifSource, i, NULL));
//        NSLog(@"kCGImagePropertyGIFDictionary %@", [dict valueForKey:(NSString*)kCGImagePropertyGIFDictionary]);
        
        // get gif size
        if (gifWidth != NULL && gifHeight != NULL) {
            *gifWidth = [[dict valueForKey:(NSString*)kCGImagePropertyPixelWidth] floatValue];
            *gifHeight = [[dict valueForKey:(NSString*)kCGImagePropertyPixelHeight] floatValue];
        }
        
        // kCGImagePropertyGIFDictionary中kCGImagePropertyGIFDelayTime，kCGImagePropertyGIFUnclampedDelayTime值是一样的
        NSDictionary *gifDict = [dict valueForKey:(NSString*)kCGImagePropertyGIFDictionary];
        [delayTimes addObject:[gifDict valueForKey:(NSString*)kCGImagePropertyGIFDelayTime]];
        
        if (totalTime) {
            *totalTime = *totalTime + [[gifDict valueForKey:(NSString*)kCGImagePropertyGIFDelayTime] floatValue];
        }
    }
}

@interface EVGIFView() {
    NSMutableArray *_frames;
    NSMutableArray *_frameDelayTimes;
    
    CGFloat _totalTime;         // seconds
    CGFloat _width;
    CGFloat _height;
}
@end

@implementation EVGIFView

- (void)setGifImageNamed:(NSString *)gifImageNamed {
    if ([_gifImageNamed isEqualToString:gifImageNamed]) {
        return;
    }
    _gifImageNamed = gifImageNamed;
    [self setUpInit];
    if (!isEmpty(_gifImageNamed)) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:_gifImageNamed ofType:@"gif"];
        NSURL    *fileURL  = [NSURL fileURLWithPath:filePath];
        if (fileURL) {
            getFrameInfo((__bridge CFURLRef)fileURL, _frames, _frameDelayTimes, &_totalTime, &_width, &_height);
        }
    }
}

- (id)initWithImageNamed:(NSString *)imageNamed
{
    self = [super init];
    if (self) {
        [self setUpInit];
        NSString *filePath = [[NSBundle mainBundle] pathForResource:imageNamed ofType:@"gif"];
        NSURL    *fileURL  = [NSURL fileURLWithPath:filePath];
        if (fileURL) {
            getFrameInfo((__bridge CFURLRef)fileURL, _frames, _frameDelayTimes, &_totalTime, &_width, &_height);
        }
        CGRect frame = self.frame;
        frame.size.width = _width;
        frame.size.height = _height;
        self.frame = frame;
    }
    return self;
}

- (id)initWithCenter:(CGPoint)center fileURL:(NSURL*)fileURL
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        
        [self setUpInit];
        
        if (fileURL) {
            getFrameInfo((__bridge CFURLRef)fileURL, _frames, _frameDelayTimes, &_totalTime, &_width, &_height);
        }
        
        self.frame = CGRectMake(0, 0, _width, _height);
        self.center = center;
    }
    
    return self;
}

- (void)setUpInit {
    _frames = [[NSMutableArray alloc] init];
    _frameDelayTimes = [[NSMutableArray alloc] init];
    
    _width = 0;
    _height = 0;
}

+ (NSArray*)framesInGif:(NSURL *)fileURL
{
    NSMutableArray *frames = [NSMutableArray arrayWithCapacity:3];
    NSMutableArray *delays = [NSMutableArray arrayWithCapacity:3];
    
    getFrameInfo((__bridge CFURLRef)fileURL, frames, delays, NULL, NULL, NULL);
    
    return frames;
}

- (void)startGif
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"contents"];
    
    NSMutableArray *times = [NSMutableArray arrayWithCapacity:3];
    CGFloat currentTime = 0;
    NSUInteger count = _frameDelayTimes.count;
    for (int i = 0; i < count; ++i) {
        [times addObject:[NSNumber numberWithFloat:(currentTime / _totalTime)]];
        currentTime += [[_frameDelayTimes objectAtIndex:i] floatValue];
    }
    [animation setKeyTimes:times];
    
    NSMutableArray *images = [NSMutableArray arrayWithCapacity:3];
    for (int i = 0; i < count; ++i) {
        [images addObject:[_frames objectAtIndex:i]];
    }
    
    [animation setValues:images];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    animation.duration = _totalTime;
    animation.delegate = self;
    animation.repeatCount = HUGE_VAL;
    animation.removedOnCompletion = NO;
    
    [self.layer addAnimation:animation forKey:@"gifAnimation"];
}

- (void)stopGif
{
    [self.layer removeAllAnimations];
}

// remove contents when animation end
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    self.layer.contents = nil;
}
@end

