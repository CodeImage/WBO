//
//  LJMainController.m
//  WBO
//
//  Created by JackLou on 7/20/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import "LJMainController.h"
#import "LJHomeController.h"
#import "LJMessageController.h"
#import "LJDiscoverController.h"
#import "LJProfileController.h"

@interface LJMainController ()

@end

@implementation LJMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
}

- (void)setupUI{
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addController:[LJHomeController new] withTitle:@"首页" andImageName:@"tabbar_home"];
    [self addController:[LJMessageController new] withTitle:@"信息" andImageName:@"tabbar_message_center"];
    [self addController:[LJDiscoverController new] withTitle:@"发现" andImageName:@"tabbar_discover"];
    [self addController:[LJProfileController new] withTitle:@"我" andImageName:@"tabbar_profile"];
    
}

#pragma mark - 添加子控制器
- (void)addController:(UIViewController *)vc withTitle:(NSString *)title andImageName:(NSString *)imgName{
    
    vc.title = title;
    [vc.tabBarItem setImage:[[UIImage imageNamed:imgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",imgName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [self addChildViewController:[[UINavigationController alloc] initWithRootViewController:vc]];
    
    
    
}



@end
