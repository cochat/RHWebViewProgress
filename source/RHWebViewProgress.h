//
//  YCWebViewProgress.h
//  CAMedia --TimingFunction
//
//  Created by apple on 2017/6/6.
//  Copyright © 2017年 玉河川. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RHWebViewProgress : UIView

/* The basic progress of the object. Defaults to 0.0 */

@property (nonatomic, assign) float progress;

/* The scale of the progressView background color. Defaults to 
 * [UIColor colorWithRed:22.f / 255.f green:126.f / 255.f blue:251.f / 255.f alpha:1.0]*/
@property (nonatomic, assign) UIColor *progressColor;

/* The scale of the simulated Progress. Defaults to 0.95 */

@property (nonatomic, assign) float simulatedProgress;

/* A timing function defining the pacing of the animation. Defaults to
 * (0.10 :1.0 :0.25 :0.95) */

@property (nonatomic, strong) CAMediaTimingFunction *timingFunction;

/**
 Start simulated progress animation.
 */
- (void)displayStartAnimation;

@end
