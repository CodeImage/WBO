//
//  LJProgressView.h
//  WBO
//
//  Created by JackLou on 7/21/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJProgressView : UIProgressView
@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,assign,getter=isFinished) BOOL finished;

- (void)beginLoad;
- (void)stopLoad;
@end
