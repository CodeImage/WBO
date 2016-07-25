//
//  LJBarButtonItem.m
//  WBO
//
//  Created by JackLou on 7/20/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import "LJBarButtonItem.h"

@implementation LJBarButtonItem
- (instancetype)initWithTitle:(NSString *)title imageName:(NSString *)imgName target:(id)target action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setTitleColor:kThemeColor forState:UIControlStateNormal];
    
    btn.titleLabel.font = [UIFont systemFontOfSize:16];
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    if (title.length) {
        [btn setTitle:title forState:UIControlStateNormal];
        
        [btn sizeToFit];
    }
    
    if (imgName.length) {
        [btn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    }
    
    return [super initWithCustomView:btn];
}
@end
