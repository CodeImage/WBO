//
//  LJHomeOriginalView.m
//  WBO
//
//  Created by JackLou on 7/25/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import "LJHomeOriginalView.h"
#import "UIImageView+WebCache.h"

@implementation LJHomeOriginalView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    
    return self;
}

#pragma mark - 设置UI
- (void)setupUI{
    
    [self addSubview:self.iconImageView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.rankImageView];
    [self addSubview:self.timeLabel];
    [self addSubview:self.sourceLabel];
    [self addSubview:self.avatarImageView];
    [self addSubview:self.contentLabel];
    
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.offset(10);
        make.width.height.equalTo(@40);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImageView.mas_top);
        make.leading.equalTo(self.iconImageView.mas_trailing).offset(10);
    }];
    
    [self.rankImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_top);
        make.leading.equalTo(self.nameLabel.mas_trailing).offset(10);
    }];

    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.nameLabel.mas_leading);
        make.bottom.equalTo(self.iconImageView.mas_bottom);
    }];
    
    [self.sourceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.timeLabel.mas_bottom);
        make.leading.equalTo(self.timeLabel.mas_trailing).offset(10);
    }];
    
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.iconImageView.mas_trailing);
        make.centerY.equalTo(self.iconImageView.mas_bottom);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImageView.mas_bottom).offset(10);
        make.leading.offset(10);
        make.trailing.offset(-10);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
    }];
}

#pragma mark - 重写setter方法
- (void)setHomeCellViewModel:(LJHomeCellViewModel *)homeCellViewModel{
    _homeCellViewModel = homeCellViewModel;
    
    NSURL *url = [NSURL URLWithString:homeCellViewModel.statusInfo.user.profile_image_url];
    
    [self.iconImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"avatar_default"]];
    
    self.nameLabel.text = homeCellViewModel.statusInfo.user.name;
    
    self.rankImageView.image = homeCellViewModel.rankImage;
    
    self.timeLabel.text = homeCellViewModel.time;
    
    self.sourceLabel.text = homeCellViewModel.source;
    
    self.avatarImageView.image = homeCellViewModel.avatarImage;
    
    self.contentLabel.text = homeCellViewModel.statusInfo.text;
}


#pragma mark - 懒加载控件

- (UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView = [UIImageView new];
        
        _iconImageView.layer.cornerRadius = 20;
        _iconImageView.layer.masksToBounds = YES;
        
    }
    return _iconImageView;
}

- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        
        _nameLabel.font = [UIFont systemFontOfSize:16];
    }
    return _nameLabel;
}

- (UIImageView *)rankImageView {
    if (!_rankImageView) {
        _rankImageView = [UIImageView new];
        
    }
    
    return _rankImageView;
}

- (UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [UILabel new];
        _timeLabel.font = [UIFont systemFontOfSize:15];
        _timeLabel.textColor = kThemeColor;
    }
    
    return _timeLabel;
}

- (UILabel *)sourceLabel{
    if (!_sourceLabel) {
        _sourceLabel = [UILabel new];
        
        _sourceLabel.font = [UIFont systemFontOfSize:15];
        _sourceLabel.textColor = [UIColor lightGrayColor];
    }
    
    return _sourceLabel;
}

- (UIImageView *)avatarImageView{
    if (!_avatarImageView) {
        _avatarImageView = [UIImageView new];
        
    }
    return _avatarImageView;
}

- (UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [UILabel new];
        _contentLabel.font = [UIFont systemFontOfSize:16];
        _contentLabel.numberOfLines = 0;
        
    }
    
    return _contentLabel;
}

@end
