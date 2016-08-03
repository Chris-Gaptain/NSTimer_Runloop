//
//  ViewController.m
//  Test
//
//  Created by peidong on 16/8/3.
//  Copyright © 2016年 Peidong. All rights reserved.
//

#define kWidth self.view.frame.size.width

#define kHeight self.view.frame.size.height

#import "ViewController.h"

@interface ViewController ()
{
    NSInteger _time;
}

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UILabel *timeLabel;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%f,%f",self.view.frame.size.width,self.view.frame.size.height);
    
    _time = 59;
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.timeLabel];
    
    /*
     *  NSDefaultRunLoopMode    默认,空闲状态
     *  UITrackingRunLoopMode   scrollView滑动时
     *  NSRunLoopCommonModes    Mode集合
     *
     */
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeFired:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)timeFired:(NSTimer *)sender {
    
    _timeLabel.text = [NSString stringWithFormat:@"%ld",_time];
    _time --;
}


- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        _scrollView.backgroundColor = [UIColor redColor];
        _scrollView.contentSize = CGSizeMake(kWidth, kHeight+200);
    }
    return _scrollView;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake((kWidth-50)/2, 300, 50, 25)];
        _timeLabel.backgroundColor = [UIColor whiteColor];
        _timeLabel.text = [NSString stringWithFormat:@"%ld",_time];
    }
    return _timeLabel;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
