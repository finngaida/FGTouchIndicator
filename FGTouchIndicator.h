//
//  FGTouchIndicator.h
//  FabTap
//
//  Created by Finn Gaida on 18.05.14.
//  Copyright (c) 2014 Finn Gaida. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FGTouchIndicator : UIView

@property (nonatomic) CGPoint startPoint;
@property (nonatomic) CGPoint endPoint;
@property (nonatomic) CGFloat duration;
@property (nonatomic) BOOL animating;

- (id)initWithFromPoint:(CGPoint)start toPoint:(CGPoint)end duration:(CGFloat)time;
+ (FGTouchIndicator *)touchIndicatorAnimatedFromPoint:(CGPoint)start toPoint:(CGPoint)end withDuration:(CGFloat)time;
- (void)startAnimating;
- (void)stopAnimating;

@end
