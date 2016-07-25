//
//  LJTabBar.m
//  WBO
//
//  Created by JackLou on 7/20/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import "LJTabBar.h"

@interface LJTabBar()
@property (nonatomic,strong) UIButton *composeButton;
@end

@implementation LJTabBar

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    
    return self;
}

#pragma mark - 设置UI
- (void)setupUI{
    
    [self addSubview:self.composeButton];
    [self.composeButton sizeToFit];
    
}

#pragma mark - 布局子控件
- (void)layoutSubviews{
    [super layoutSubviews];
    
    
    self.composeButton.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
    
    
    CGFloat w = kScreenWidth * 0.2;
    NSInteger index = 0;
    
    for (UIView * v in self.subviews) {
        if ([v isMemberOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            CGFloat x = index * w;
            CGFloat y = v.frame.origin.y;
            CGFloat h = v.frame.size.height;
            
            v.frame = CGRectMake(x, y, w, h);
            
            index ++;
            
            if (index == 2) {
                index++;
            }
            
            
        }
    }
    
}

#pragma mark - 懒加载

- (UIButton *)composeButton{
    if (!_composeButton) {
        _composeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_composeButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [_composeButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        
        [_composeButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [_composeButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        
    }
    
    return _composeButton;
}

@end
