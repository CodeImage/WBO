//
//  LJMessageController.m
//  WBO
//
//  Created by JackLou on 7/20/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import "LJMessageController.h"
#import "LJVisitorView.h"

@interface LJMessageController ()

@end

@implementation LJMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI2];
}

- (void)setupUI2{
    if (!self.isLogin) {
        LJVisitorView *visitorView = (LJVisitorView *)self.view;
        [visitorView setupUIWithImageName:@"visitordiscover_image_message" content:@"登录后，别人评论你的微博，发给你的消息，都会在这里收到通知"];
    }
}


@end
