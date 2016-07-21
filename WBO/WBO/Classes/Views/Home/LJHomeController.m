//
//  LJHomeController.m
//  WBO
//
//  Created by JackLou on 7/20/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import "LJHomeController.h"
#import "LJVisitorView.h"
#import "UIBarButtonItem+Custom.h"
#import "LJBarButtonItem.h"
@interface LJHomeController ()

@end

@implementation LJHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI2];
}

- (void)setupUI2{
    if (!self.isLogin) {
        LJVisitorView *visitorView = (LJVisitorView *)self.view;
        [visitorView setupUIWithImageName:nil content:nil];
    }
}

@end
