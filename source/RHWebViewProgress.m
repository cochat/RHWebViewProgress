//
//  YCWebViewProgress.m
//  CAMedia --TimingFunction
//
//  Created by apple on 2017/6/6.
//  Copyright © 2017年 玉河川. All rights reserved.
//

#import "RHWebViewProgress.h"

static const CGFloat defalutLineHeight = 3.0;

static const CFTimeInterval loadingStartDuration = 15.0;

static const CFTimeInterval loadingCompletedDuration = 0.1;

@interface RHWebViewProgress ()<CAAnimationDelegate>

@property (nonatomic, strong) CAShapeLayer *progressBarView;

@property (nonatomic, assign) CFTimeInterval simulatedDuration;


@end

@implementation RHWebViewProgress

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configureViews];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self configureViews];
}


-(void)configureViews {
    self.userInteractionEnabled = NO;
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    _progressBarView = [CAShapeLayer layer];
    _progressBarView.frame = self.bounds;
    
    UIColor *tintColor;
    if (self.progressColor) {
        tintColor = self.progressColor;
    } else {
        tintColor = [UIColor colorWithRed:22.f / 255.f green:126.f / 255.f blue:251.f / 255.f alpha:1.0]; // iOS7 Safari bar color
    }
    if ([UIApplication.sharedApplication.delegate.window respondsToSelector:@selector(setTintColor:)] && UIApplication.sharedApplication.delegate.window.tintColor) {
        tintColor = UIApplication.sharedApplication.delegate.window.tintColor;
    }
    _progressBarView.strokeColor = tintColor.CGColor;
    _progressBarView.fillColor = [UIColor clearColor].CGColor;
    _progressBarView.lineWidth = defalutLineHeight;
    _progressBarView.opacity = 1;
    
    [self.layer addSublayer:_progressBarView];
}

- (void)setProgress:(float)progress {
    [self displayCompletedAnimation:progress];
}

- (void)displayStartAnimation {
    
    float scale = self.simulatedProgress > 0 ?self.simulatedProgress:0.95;
    CGPoint p1 = CGPointMake(0,defalutLineHeight / 2);
    CGPoint p2 = CGPointMake(self.bounds.size.width * scale,defalutLineHeight / 2);
    _simulatedDuration = loadingStartDuration;
    [self displayLayer:p1 stopPoint:p2];

}

- (void)displayCompletedAnimation:(float)progress{
    
    CGPoint p1 = CGPointMake(0,1.5);
    CGPoint p2 = CGPointMake(self.bounds.size.width * progress,defalutLineHeight / 2);
    _simulatedDuration = loadingCompletedDuration;
    [self displayLayer:p1 stopPoint:p2];

}

- (void)displayLayer:(CGPoint)startPoint stopPoint:(CGPoint)stopPoint {
    
    //绘制路径
    UIBezierPath *firstPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake (0,0,0,defalutLineHeight / 2)];
    [firstPath addLineToPoint: startPoint];
    [firstPath addLineToPoint: stopPoint];
    
    _progressBarView.path = firstPath.CGPath;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = _simulatedDuration;
    CAMediaTimingFunction *function = self.timingFunction ?:[CAMediaTimingFunction functionWithControlPoints:0.10 :1.0 :0.25 :0.95];
    animation.timingFunction = function;
    animation.fromValue = @(0.0);
    animation.toValue = @(1.0);
    if (_simulatedDuration == loadingCompletedDuration) {
        animation.delegate = self;
    }
    [_progressBarView addAnimation:animation forKey:@"path"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (flag) {
        [UIView animateWithDuration:loadingCompletedDuration animations:^{
            _progressBarView.opacity = 0;
        }];
    }
}


@end
