//
//  LJHomeToolBar.m
//  WBO
//
//  Created by JackLou on 7/25/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import "LJHomeToolBar.h"

@implementation LJHomeToolBar


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}


- (void)setupUI{
    
    UIButton *retweetButton = [self addButtonWithImageName:@"timeline_icon_retweet" title:@"转发"];
    
    UIButton *commentButton = [self addButtonWithImageName:@"timeline_icon_comment" title:@"评论"];
    
    UIButton *unlikeButton = [self addButtonWithImageName:@"timeline_icon_unlike" title:@"赞"];
    
    UIImageView *seperatorImageView1 = [self addSeperatorImageView];
    
    UIImageView *seperatorImageView2 = [self addSeperatorImageView];
    
    [retweetButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.leading.offset(0);
    }];
    
    [commentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.leading.equalTo(retweetButton.mas_trailing);
        make.width.equalTo(retweetButton.mas_width);
    }];
    
    [unlikeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.trailing.offset(0);
        make.leading.equalTo(commentButton.mas_trailing);
        make.width.equalTo(commentButton.mas_width);
    }];
    
    [seperatorImageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(retweetButton.mas_trailing);
        make.centerY.equalTo(self);
    }];
    
    [seperatorImageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(commentButton.mas_trailing);
        make.centerY.equalTo(self);
    }];
}

#pragma mark - 添加按钮封装
- (UIButton *)addButtonWithImageName:(NSString *)imgName title:(NSString *)title{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    
    
    [button setBackgroundImage:[UIImage imageNamed:@"timeline_card_top_background"] forState:UIControlStateNormal];
    
    [self addSubview:button];
    
    return button;
}

#pragma mark - 添加分割线封装
- (UIImageView *)addSeperatorImageView{
    
    UIImageView *imageView = [UIImageView new];
    imageView.image = [UIImage imageNamed:@"timeline_card_bottom_line"];
    
    [self addSubview:imageView];
    
    return imageView;
    
}

@end
