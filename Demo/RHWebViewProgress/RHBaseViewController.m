//
//  RHBaseViewController.m
//  RHWebViewProgress
//
//  Created by apple on 2017/6/8.
//  Copyright © 2017年 玉河川. All rights reserved.
//

#import "RHBaseViewController.h"
#import "RHButton.h"
#import "RHWebViewProgress.h"

@interface RHBaseViewController ()

@property (nonatomic, strong) RHButton *display;
@property (nonatomic, strong) RHButton *loading;
@property (nonatomic, strong) RHWebViewProgress *progressView;

@end

@implementation RHBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
    // Do any additional setup after loading the view.
}

- (void)setUp {
    self.title = @"加载进度条";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar addSubview:self.progressView];

    CGFloat width = 200;
    CGFloat height = 50;
    CGFloat x = (self.view.bounds.size.width - width) / 2.0;
    CGFloat y1 = 200;
    CGFloat y2 = y1 + height + 20;
    _display = [[RHButton alloc]initWithFrame:CGRectMake(x, y1, width, height)];
    _display.title = @"演示";
    _display.buttonColor = [UIColor colorWithRed:70 / 225.0 green:187 / 255.0 blue:38 / 255.0 alpha:1];
    typeof(self) __weak weakSelf = self;
    _display.operation = ^{
        [weakSelf displayAnimation];
    };
    _loading = [[RHButton alloc]initWithFrame:CGRectMake(x, y2, width, height)];
    _loading.title = @"加载完成";
    _loading.buttonColor = [UIColor redColor];
    _loading.operation = ^{
        [weakSelf loadingAnimation];
    };
    [self.view addSubview:_display];
    [self.view addSubview:_loading];
}

- (void)displayAnimation {
    UIViewAnimationOptions op = UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAllowAnimatedContent | UIViewAnimationOptionBeginFromCurrentState;
    [UIView animateWithDuration:0.1 delay:0 options:op animations:^{
        [_display.layer setValue:@(0.97) forKeyPath:@"transform.scale"];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 delay:0 options:op animations:^{
             [_display.layer setValue:@(1.008) forKeyPath:@"transform.scale"];
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1 delay:0 options:op animations:^{
                [_display.layer setValue:@(1.008) forKeyPath:@"transform.scale"];
            } completion:^(BOOL finished) {
                [self.progressView displayStartAnimation];
            }];
        }];
    }];
}

- (void)loadingAnimation {
    UIViewAnimationOptions op = UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAllowAnimatedContent | UIViewAnimationOptionBeginFromCurrentState;
    [UIView animateWithDuration:0.1 delay:0 options:op animations:^{
        [_loading.layer setValue:@(0.97) forKeyPath:@"transform.scale"];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 delay:0 options:op animations:^{
            [_loading.layer setValue:@(1.008) forKeyPath:@"transform.scale"];
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1 delay:0 options:op animations:^{
                [_loading.layer setValue:@(1.008) forKeyPath:@"transform.scale"];
            } completion:^(BOOL finished) {
                [self.progressView setProgress:1.0];
            }];
        }];
    }];
    
}

- (RHWebViewProgress *)progressView {
    if (!_progressView) {
        CGFloat progressBarHeight = 3.0;
        CGRect navigaitonBarBounds = self.navigationController.navigationBar.bounds;
        CGRect barFrame = CGRectMake(0, navigaitonBarBounds.size.height, navigaitonBarBounds.size.width, progressBarHeight);
        _progressView = [[RHWebViewProgress alloc] initWithFrame:barFrame];
    }
    return _progressView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
