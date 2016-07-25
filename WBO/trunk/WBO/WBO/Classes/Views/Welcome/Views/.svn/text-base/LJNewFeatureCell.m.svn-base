

//
//  LJNewFeatureCell.m
//  WBO
//
//  Created by JackLou on 7/24/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import "LJNewFeatureCell.h"

@implementation LJNewFeatureCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
        
    }
    return self;
}


- (void)setupUI{
    
    self.backgroundColor = [UIColor whiteColor];
    
    [self.contentView addSubview:self.imageView];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    
    
    
    [self.contentView addSubview:self.startButton];
    [self.startButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).offset(-100);
        make.centerX.equalTo(self.contentView);
    }];
}

#pragma mark - 重写setter
- (void)setIndex:(NSInteger)index{
    _index = index;
    
    self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"new_feature_%ld",index + 1]];
    
    
}

#pragma mark - 懒加载控件

- (UIImageView *)imageView{
    if (!_imageView) {
        
        UIImageView *imageView = [UIImageView new];
        
        _imageView = imageView;
    }
    return _imageView;
}

- (UIButton *)startButton{
    if (!_startButton) {
        UIButton *startButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        
        [startButton setTitle:@"开始体验" forState:UIControlStateNormal];
        startButton.titleLabel.font = [UIFont systemFontOfSize:18];
        [startButton setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
        
        startButton.hidden = YES;
        
        _startButton = startButton;
    }
    
    return _startButton;
}
@end
