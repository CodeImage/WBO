//
//  LJWelcomeController.m
//  WBO
//
//  Created by JackLou on 7/24/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import "LJWelcomeController.h"
#import "LJWelcomeView.h"

@interface LJWelcomeController ()
@property (nonatomic,strong) LJWelcomeView *welcomeView;
@end

@implementation LJWelcomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

// 必须放在此处头像动画
- (void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    [self.welcomeView iconAnimationWithFinishedBlock:^{
        
        [[NSNotificationCenter defaultCenter] postNotificationName:kSwitchRootVcNotification object:@"welcome"];
    }];
}

#pragma mark - 设置UI
- (void)setupUI{
    
    [self.view addSubview:self.welcomeView];
    [self.welcomeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}


#pragma mark - 懒加载控件
- (LJWelcomeView *)welcomeView{
    if (!_welcomeView) {
        _welcomeView = [[LJWelcomeView alloc] init];
        
    }
    return _welcomeView;
}

@end
