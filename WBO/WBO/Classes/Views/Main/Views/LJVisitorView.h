//
//  LJVisitorView.h
//  WBO
//
//  Created by JackLou on 7/20/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJVisitorView : UIView


@property (nonatomic,copy) void(^loginBlock)();

- (void)setupUIWithImageName:(NSString *)imgName content:(NSString *)content;
@end
