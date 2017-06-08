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
    RHButton *display = [[RHButton alloc]initWithFrame:CGRectMake(x, y1, width, height)];
    display.title = @"演示";
    display.buttonColor = [UIColor colorWithRed:70 / 225.0 green:187 / 255.0 blue:38 / 255.0 alpha:1];
    display.operation = ^{
        [self displayAnimation];
    };
    RHButton *loading = [[RHButton alloc]initWithFrame:CGRectMake(x, y2, width, height)];
    loading.title = @"加载完成";
    loading.buttonColor = [UIColor redColor];
    loading.operation = ^{
        [self loadingAnimation];
    };
    [self.view addSubview:display];
    [self.view addSubview:loading];
}

- (void)displayAnimation {
    [self.progressView displayStartAnimation];
}

- (void)loadingAnimation {
    [self.progressView setProgress:1.0];
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
