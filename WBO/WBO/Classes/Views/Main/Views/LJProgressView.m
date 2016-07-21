//
//  LJProgressView.m
//  WBO
//
//  Created by JackLou on 7/21/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import "LJProgressView.h"

@interface LJProgressView ()

@end

@implementation LJProgressView


#pragma mark - 提供开始加载网页的接口
- (void)beginLoad{
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1/60 target:self selector:@selector(beginTimer) userInfo:nil repeats:YES];
    
    
}

#pragma mark - 提供停止加载网页的接口
- (void)stopLogin{

    self.hidden = self.isFinished;
    
    [self.timer invalidate];
}


#pragma mark - 定时器调用方法
- (void)beginTimer{

    if (self.isFinished) {
        self.hidden = YES;
        return;
    }
    
    if (self.progress < 0.9) {
        self.progress += 0.01;
    }else {
        self.progress = 0.9;
    }
}



@end
