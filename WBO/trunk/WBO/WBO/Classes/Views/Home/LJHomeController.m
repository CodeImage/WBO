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
#import "LJHomeControllerViewModel.h"
#import "LJOAuthControllerViewModel.h"
#import "LJHomeStatusCell.h"


@interface LJHomeController () <UITableViewDataSource>
@property (nonatomic,strong) LJHomeControllerViewModel *homeControllerViewModel;
@end

static NSString *identifier = @"home";

@implementation LJHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI2];
}

#pragma mark - 设置UI
- (void)setupUI2{
    if (!self.isLogin) {
        LJVisitorView *visitorView = (LJVisitorView *)self.view;
        [visitorView setupUIWithImageName:nil content:nil];
        
        return;
    }
    
    [self.homeControllerViewModel getStatusListWithAccountInfo:[LJOAuthControllerViewModel sharedViewModel].accountInfo finished:^(BOOL isSuccess) {
        
        if (!isSuccess) {
            NSLog(@"isSuccess:%d",isSuccess);
            return;
        }
        
        self.tableView.estimatedRowHeight = 200;
        self.tableView.dataSource = self;
        [self.tableView registerClass:[LJHomeStatusCell class] forCellReuseIdentifier:identifier];
        
    }];
}

#pragma mark - tableView的代理方法
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.homeControllerViewModel.statusList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LJHomeStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    cell.homeCellViewModel = self.homeControllerViewModel.statusList[indexPath.row];
    
    return cell;
    
}

#pragma mark - 懒加载
- (LJHomeControllerViewModel *)homeControllerViewModel{
    if (!_homeControllerViewModel) {
        _homeControllerViewModel = [LJHomeControllerViewModel new];
    }
    
    return _homeControllerViewModel;
}

@end
