//
//  LJDiscoverController.m
//  WBO
//
//  Created by JackLou on 7/20/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import "LJDiscoverController.h"
#import "LJVisitorView.h"

@interface LJDiscoverController ()

@end

@implementation LJDiscoverController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI2];
}

- (void)setupUI2{
    if (!self.isLogin) {
        LJVisitorView *visitorView = (LJVisitorView *)self.view;
        [visitorView setupUIWithImageName:@"visitordiscover_image_message" content:@"登录后，最新、最热微博尽在掌握，不再会与实事潮流擦肩而过"];
    }
}


@end
