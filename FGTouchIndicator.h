//
//  FGTouchIndicator.h
//  FabTap
//
//  Created by Finn Gaida on 18.05.14.
//  Copyright (c) 2014 Finn Gaida. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FGTouchIndicator : UIView {
    
    CGFloat _startValue;
    CGFloat _endValue;
    
}

@property (nonatomic) CGPoint startPoint;
@property (nonatomic) CGPoint endPoint;
@property (nonatomic) CGFloat duration;
@property (nonatomic) BOOL horizontal;
@property (nonatomic) BOOL animating;

- (id)initWithFromPoint:(CGPoint)start toPoint:(CGPoint)end duration:(CGFloat)time;

/// With this method you need to call -startAnimating and -stopAnimating
+ (FGTouchIndicator *)touchIndicatorAnimatedFromPoint:(CGPoint)start toPoint:(CGPoint)end withDuration:(CGFloat)time;

/// With this method you don't have to worry about starting and ending the animation, it will never end though
+ (FGTouchIndicator *)touchIndicatorAnimatedFromValue:(CGFloat)start toValue:(CGFloat)end horizontal:(BOOL)horizontal withDuration:(CGFloat)time;

- (void)startAnimating;
- (void)stopAnimating;

@end
