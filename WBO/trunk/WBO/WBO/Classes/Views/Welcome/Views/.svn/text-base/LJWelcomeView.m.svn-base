//
//  LJWelcomeView.m
//  WBO
//
//  Created by JackLou on 7/24/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import "LJWelcomeView.h"
#import "UIImageView+WebCache.h"
#import "LJOAuthControllerViewModel.h"

@interface LJWelcomeView ()
// 懒加载weak控件，需要在懒加载中addSubview
@property (nonatomic,strong) UIImageView *iconImageView;

// 懒加载strong控件，在懒加载中可以不addSubview
@property (nonatomic,strong) UILabel *welcomeLabel;
@end

@implementation LJWelcomeView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    
    return self;
}


- (void)setupUI{
    
    self.image = [UIImage imageNamed:@"ad_background"];
    
    // iconImageView已经添加过了
    [self addSubview:self.iconImageView];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self).offset(400);
        make.width.height.mas_equalTo(90);
    }];
    
    
    [self addSubview:self.welcomeLabel];
    [self.welcomeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.iconImageView.mas_bottom).offset(16);
    }];
    
    
}

#pragma mark - 控制器willAppear调用头像动画
- (void)iconAnimationWithFinishedBlock:(void(^)())finishedBlock{
    
    [self.iconImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(100);
    }];
    
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionTransitionNone animations:^{
        
        [self layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:1 animations:^{
            self.welcomeLabel.hidden = NO;
            
        } completion:^(BOOL finished) {
            
            if(finishedBlock) {
                finishedBlock();
            }
        }];
    }];
}


#pragma mark - 懒加载
- (UIImageView *)iconImageView{
    if (!_iconImageView) {
        UIImageView *imageView = [[UIImageView alloc]init];
        
        NSURL *url = [NSURL URLWithString:[LJOAuthControllerViewModel sharedViewModel].accountInfo.avatar_large];
        
        [imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"avatar_default"]];
        
        imageView.layer.cornerRadius = 45;
        imageView.layer.masksToBounds = YES;
        
        _iconImageView = imageView;
        
        
        
        // 约束放在懒加载
//        [self addSubview:_iconImageView];
        
    }
    
    return _iconImageView;
}

- (UILabel *)welcomeLabel{
    if (!_welcomeLabel) {
        UILabel *label = [UILabel new];
        label.text = @"欢迎回来";
        label.font = [UIFont systemFontOfSize:18];
        
        label.hidden = YES;
        
        _welcomeLabel = label;
    }
    return _welcomeLabel;
}
@end
