//
//  RHButton.m
//  RHWebViewProgress
//
//  Created by apple on 2017/6/8.
//  Copyright © 2017年 玉河川. All rights reserved.
//

#import "RHButton.h"

@implementation RHButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self= [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)setUp {
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self addTarget:self action:@selector(tapClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)tapClick {
    self.operation();
}

- (void)setTitle:(NSString *)title {
    [self setTitle:title forState:UIControlStateNormal];
}

- (void)setButtonColor:(UIColor *)buttonColor {
    [self setBackgroundColor:buttonColor];
}

@end
