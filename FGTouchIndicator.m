//
//  FGTouchIndicator.m
//  FabTap
//
//  Created by Finn Gaida on 18.05.14.
//  Copyright (c) 2014 Finn Gaida. All rights reserved.
//

#import "FGTouchIndicator.h"

@implementation FGTouchIndicator

- (id)initWithFromPoint:(CGPoint)start toPoint:(CGPoint)end duration:(CGFloat)time {
    
    self = [super init];
    if (self) {
        
        self.frame = CGRectMake(start.x-50, start.y-50, 100, 100);
        self.backgroundColor = [UIColor colorWithWhite:1 alpha:.8];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = self.frame.size.width/2;
        self.alpha = 0;
        
        _startPoint = start;
        _endPoint = end;
        _duration = time;
        _animating = NO;
        
    }
    return self;
    
}

+ (FGTouchIndicator *)touchIndicatorAnimatedFromPoint:(CGPoint)start toPoint:(CGPoint)end withDuration:(CGFloat)time {
    
    return [[FGTouchIndicator alloc] initWithFromPoint:start toPoint:end duration:time];
    
}

- (void)startAnimating {
    
    if (!_animating) {
        
        _animating = YES;
        
        [UIView animateKeyframesWithDuration:_duration delay:0 options:UIViewKeyframeAnimationOptionRepeat animations:^{
            
            [UIView setAnimationRepeatCount:50];
            
            [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:.3 animations:^{
                
                self.alpha = 1;
                self.center = [self pointWithPercentage:.3];
                self.transform = CGAffineTransformMakeScale(.5, .5);
                
            }];
            
            [UIView addKeyframeWithRelativeStartTime:.3 relativeDuration:.3 animations:^{
                
                self.center = [self pointWithPercentage:.7];
                
            }];
            
            [UIView addKeyframeWithRelativeStartTime:.6 relativeDuration:.3 animations:^{
                
                self.alpha = 0;
                self.center = [self pointWithPercentage:1];
                self.transform = CGAffineTransformIdentity;
                
            }];
            
        } completion:^(BOOL finished) {
            
            _animating = NO;
            
        }];
        
    } else {
        
        NSLog(@"Touch Indicator is already animating");
        
    }
    
}

- (void)stopAnimating {
    
    if (_animating) {
        
        [UIView animateWithDuration:.5 animations:^{
            
            self.alpha = 0;
            
        } completion:^(BOOL finished) {
            
            _animating = NO;
            [self removeFromSuperview];
            
        }];
    } else {
        
        NSLog(@"Touch Indicator isn't animting, so it can't stop...");
        
    }
}

- (CGPoint)pointWithPercentage:(float)perOne {
    
    return CGPointMake(_startPoint.x + (_endPoint.x-_startPoint.x)*perOne, _startPoint.y + (_endPoint.y-_startPoint.y)*perOne);
    
}

@end
