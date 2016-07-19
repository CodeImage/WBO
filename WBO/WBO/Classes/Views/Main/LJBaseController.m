//
//  LJBaseController.m
//  WBO
//
//  Created by JackLou on 7/20/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import "LJBaseController.h"
#import "LJVisitorView.h"

@interface LJBaseController ()
@property (nonatomic,weak) UITableView *tableView;
@end

@implementation LJBaseController

- (void)loadView{
    self.view = self.isLogin ? self.tableView : [LJVisitorView new];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
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
