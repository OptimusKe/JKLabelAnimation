//
//  JKNeonlampView.m
//  JKLabelAnimation
//
//  Created by 科科 on 2014/3/23.
//  Copyright (c) 2014年 KerKerStudio. All rights reserved.
//

#import "JKNeonlampView.h"

@implementation JKNeonlampView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self initWithAnimation];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


-(void)initWithAnimation{
    
    
    NSTimeInterval beginTime = CACurrentMediaTime() + 1.2;
    //            CGFloat barWidth = CGRectGetWidth(self.bounds) / 5.0;
    
    CGFloat barWidth = CGRectGetWidth(self.bounds) / 5.0;
    
    for (NSInteger i=0; i < 5; i+=1) {
        //                CALayer *layer = [CALayer layer];
        //                layer.backgroundColor = color.CGColor;
        //                layer.frame = CGRectMake(barWidth * i, 0.0, barWidth - 3.0, CGRectGetHeight(self.bounds));
        
        
        CATextLayer *layer = [[CATextLayer alloc] init];
        //                [layer setFont:@"Helvetica-Bold"];
        [layer setFontSize:20];
        [layer setFrame:CGRectMake(barWidth * i, 0.0, barWidth - 80.0, 80)];
        [layer setString:@"H"];
        [layer setAlignmentMode:kCAAlignmentCenter];
        [layer setForegroundColor:[[UIColor whiteColor] CGColor]];
        
        //                layer.transform = CATransform3DMakeScale(1.0, 0.3, 0.0);
        
        
        //Kerker modify
        layer.anchorPoint = CGPointMake(0.0, 1.0);
        
        CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
        anim.removedOnCompletion = NO;
        anim.beginTime = beginTime - (1.2 - (0.1 * i));
        anim.duration = 1.2;
        anim.repeatCount = HUGE_VALF;
        
        anim.keyTimes = @[@(0.0), @(0.2), @(0.4), @(1.0)];
        
        
        anim.timingFunctions = @[
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
                                 ];
        
        anim.values = @[
                        [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0.0, 10.0, 0.0)],
                        [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0.0, 1.0, 0.0)],
                        [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0.0, 10.0, 0.0)],
                        [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0.0, 10.0, 0.0)]
                        ];
        
        [self.layer addSublayer:layer];
        [layer addAnimation:anim forKey:@"spinkit-anim"];
        
        
        CAKeyframeAnimation *colorsAnimation = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
        colorsAnimation.values = [NSArray arrayWithObjects: (id)[UIColor greenColor].CGColor,
                                  (id)[UIColor yellowColor].CGColor, (id)[UIColor orangeColor].CGColor, (id)[UIColor redColor].CGColor, nil];
        colorsAnimation.keyTimes = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.25], [NSNumber numberWithFloat:0.5], [NSNumber numberWithFloat:0.75],[NSNumber numberWithFloat:1.0], nil];
        colorsAnimation.calculationMode = kCAAnimationPaced;
        colorsAnimation.removedOnCompletion = NO;
        colorsAnimation.fillMode = kCAFillModeForwards;
        colorsAnimation.duration = 3.0f;
        [layer addAnimation:colorsAnimation
                     forKey:@"backgroundColor"];
        
        
    }
}

@end
