//
//  LJProfileController.m
//  WBO
//
//  Created by JackLou on 7/20/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import "LJProfileController.h"
#import "LJVisitorView.h"

@interface LJProfileController ()

@end

@implementation LJProfileController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI2];
}

- (void)setupUI2{
    if (!self.isLogin) {
        LJVisitorView *visitorView = (LJVisitorView *)self.view;
        [visitorView setupUIWithImageName:@"visitordiscover_image_profile" content:@"登录后，你的微博、相册、个人资料会显示在这里，展示给别人"];
    }
}


@end
