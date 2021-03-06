//
//  LJHomeStatusCell.m
//  WBO
//
//  Created by JackLou on 7/25/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import "LJHomeStatusCell.h"
#import "LJHomeOriginalView.h"
#import "LJHomeRetweetedView.h"
#import "LJHomeToolBar.h"

@interface LJHomeStatusCell ()
@property (nonatomic,strong) LJHomeOriginalView *originalView;
@property (nonatomic,strong) LJHomeRetweetedView *retweetedView;
@property (nonatomic,strong) LJHomeToolBar *toolBar;

@property (nonatomic,strong) MASConstraint *constraint;
@end

@implementation LJHomeStatusCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI{

    [self.contentView addSubview:self.originalView];
    [self.contentView addSubview:self.retweetedView];
    [self.contentView addSubview:self.toolBar];
    
    [self.originalView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.equalTo(self.contentView);
    }];
    
    [self.retweetedView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.originalView.mas_bottom);
        make.leading.trailing.offset(0);
    }];
    
    [self.toolBar mas_makeConstraints:^(MASConstraintMaker *make) {
        self.constraint = make.top.equalTo(self.retweetedView.mas_bottom);
        make.leading.trailing.offset(0);
        make.height.equalTo(@35);
        make.bottom.equalTo(self.contentView.mas_bottom);
    }];
    
}


#pragma mark - 重写viewModel的setter
- (void)setHomeCellViewModel:(LJHomeCellViewModel *)homeCellViewModel{
    _homeCellViewModel = homeCellViewModel;
    
    self.originalView.homeCellViewModel = homeCellViewModel;
    
    [self.constraint uninstall];
    
    if (homeCellViewModel.statusInfo.retweeted_status) {
        
        self.retweetedView.homeCellViewModel = homeCellViewModel;
        self.retweetedView.hidden = NO;
        
        [self.toolBar mas_updateConstraints:^(MASConstraintMaker *make) {
            self.constraint = make.top.equalTo(self.retweetedView.mas_bottom);
        }];
        
    }else {
        self.retweetedView.hidden = YES;
        
        [self.toolBar mas_updateConstraints:^(MASConstraintMaker *make) {
            self.constraint = make.top.equalTo(self.originalView.mas_bottom);
        }];
    }
}


#pragma mark - 懒加载控件
- (LJHomeOriginalView *)originalView{
    if (!_originalView) {
        _originalView = [LJHomeOriginalView new];
        
    }
    return _originalView;
}

- (LJHomeRetweetedView *)retweetedView{
    if (!_retweetedView) {
        _retweetedView = [LJHomeRetweetedView new];
        
    }
    return _retweetedView;
}

- (LJHomeToolBar *)toolBar{
    if (!_toolBar) {
        _toolBar = [LJHomeToolBar new];
    }
    
    return _toolBar;
}

@end
