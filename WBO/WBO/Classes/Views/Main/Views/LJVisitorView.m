//
//  LJVisitorView.m
//  WBO
//
//  Created by JackLou on 7/20/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import "LJVisitorView.h"
#import <Masonry.h>

@interface LJVisitorView()

@property (nonatomic,strong) UIImageView *feedImageView;
@property (nonatomic,strong) UIImageView *maskImageView;
@property (nonatomic,strong) UIImageView *homeImageView;
@property (nonatomic,strong) UILabel *contentLabel;
@property (nonatomic,strong) UIButton *loginButton;
@property (nonatomic,strong) UIButton *registerButton;

@end

@implementation LJVisitorView

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithWhite:237/255.0 alpha:1];
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    [self addSubview:self.feedImageView];
    [self addSubview:self.maskImageView];
    [self addSubview:self.homeImageView];
    
    [self.feedImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
    }];
    
    [self.maskImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
    }];
    
    [self.homeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
    }];
    
    [self addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.maskImageView.mas_bottom).offset(16);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(230, 36));
    }];
    
    [self addSubview:self.loginButton];
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentLabel.mas_bottom).offset(16);
        make.leading.equalTo(self.contentLabel);
        make.size.mas_equalTo(CGSizeMake(100, 36));
    }];
    
    [self addSubview:self.registerButton];
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentLabel.mas_bottom).offset(16);
        make.trailing.equalTo(self.contentLabel);
        make.size.mas_equalTo(CGSizeMake(100, 36));
    }];
    
}


#pragma mark - 懒加载
- (UIImageView *)feedImageView{
    if (!_feedImageView) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"visitordiscover_feed_image_smallicon"]];
        _feedImageView = imageView;
    }
    return _feedImageView;
}

- (UIImageView *)maskImageView{
    if (!_maskImageView) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"visitordiscover_feed_mask_smallicon"]];
        _maskImageView = imageView;
    }
    return _maskImageView;
}

- (UIImageView *)homeImageView{
    if (!_homeImageView) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"visitordiscover_feed_image_house"]];
        _homeImageView = imageView;
    }
    return _homeImageView;
}

- (UILabel *)contentLabel{
    if (!_contentLabel) {
        UILabel *label = [UILabel new];
        label.text = @"关注一些人，回这里看看有什么惊喜关注一些人，回这里看看有什么惊喜";
        label.font = [UIFont systemFontOfSize:14];
        label.numberOfLines = 0;
        _contentLabel = label;
    }
    return _contentLabel;
}

- (UIButton *)loginButton{
    if (!_loginButton) {
        UIButton *button = [UIButton new];
        [button setTitle:@"登录" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [button setBackgroundImage:[self stretchedImageWithImage:[UIImage imageNamed:@"common_button_white_disable"]] forState:UIControlStateNormal];
        _loginButton = button;
    }
    return _loginButton;
}

- (UIButton *)registerButton{
    if (!_registerButton) {
        UIButton *button = [UIButton new];
        [button setTitle:@"注册" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [button setBackgroundImage:[self stretchedImageWithImage:[UIImage imageNamed:@"common_button_white_disable"]] forState:UIControlStateNormal];
        _registerButton = button;
    }
    return _registerButton;
}

#pragma mark - 拉伸图片
- (UIImage *)stretchedImageWithImage:(UIImage *)image{
    CGFloat w = image.size.width * 0.5;
    CGFloat h = image.size.height * 0.5;
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w) resizingMode:UIImageResizingModeStretch];
}
@end
