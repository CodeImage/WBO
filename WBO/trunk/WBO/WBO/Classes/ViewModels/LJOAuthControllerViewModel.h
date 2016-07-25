//
//  LJOAuthControllerViewModel.h
//  WBO
//
//  Created by JackLou on 7/24/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LJAccountInfo.h"

@interface LJOAuthControllerViewModel : NSObject

@property (nonatomic,strong) LJAccountInfo *accountInfo;

@property (nonatomic,copy) NSString *access_token;
@property (nonatomic,assign,getter=isLogin) BOOL login;

+ (instancetype)sharedViewModel;

- (void)getAccountInfoWithCode:(NSString *)code finished:(void(^)(BOOL isSuccess)) finished;

@end
