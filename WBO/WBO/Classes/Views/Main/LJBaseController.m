//
//  LJBaseController.m
//  WBO
//
//  Created by JackLou on 7/20/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import "LJBaseController.h"
#import "LJVisitorView.h"
#import "UIBarButtonItem+Custom.h"
#import "LJBarButtonItem.h"
#import "LJOAuthController.h"

@interface LJBaseController ()
@property (nonatomic,weak) UITableView *tableView;
@end

@implementation LJBaseController

- (void)loadView{
    self.view = self.isLogin ? self.tableView : [LJVisitorView new];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}


#pragma mark - 设置UI
- (void)setupUI{

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"注册" imageName:nil target:self action:@selector(loginClick)];
    
    self.navigationItem.rightBarButtonItem = [[LJBarButtonItem alloc] initWithTitle:@"登录" imageName:nil target:self action:@selector(loginClick)];
    
    if (!self.isLogin) {
        
        LJVisitorView *visitorView = (LJVisitorView *)self.view;
        visitorView.loginBlock = ^{
            [self loginClick];
        };
    }
    

}

- (void)loginClick{
    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:[LJOAuthController new]] animated:YES completion:nil];
}

#pragma mark - 懒加载
- (UITableView *)tableView{
    if (!_tableView) {
        UITableView *tableV = [UITableView new];
        _tableView = tableV;
    }
    return _tableView;
}

@end
