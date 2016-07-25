//
//  LJHomeRetweetedView.m
//  WBO
//
//  Created by JackLou on 7/25/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import "LJHomeRetweetedView.h"

@interface LJHomeRetweetedView ()
@property (nonatomic,strong) UILabel *contentLabel;


@end

@implementation LJHomeRetweetedView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
        
    }
    
    return self;
}

#pragma mark - 设置UI
- (void)setupUI{
    
    self.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    
    [self addSubview:self.contentLabel];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.offset(10);
        make.trailing.offset(-10);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
    }];
}


#pragma mark - 重写setter方法
- (void)setHomeCellViewModel:(LJHomeCellViewModel *)homeCellViewModel{
    _homeCellViewModel = homeCellViewModel;
    self.contentLabel.text = homeCellViewModel.statusInfo.retweeted_status.text;
}

#pragma mark - 懒加载控件
- (UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [UILabel new];
        _contentLabel.font = [UIFont systemFontOfSize:16];
        _contentLabel.textColor = [UIColor darkGrayColor];
        _contentLabel.numberOfLines = 0;
        _contentLabel.preferredMaxLayoutWidth = kScreenWidth - 20;
    }
    
    return _contentLabel;
}

@end
