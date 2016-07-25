//
//  LJOAuthControllerViewModel.m
//  WBO
//
//  Created by JackLou on 7/24/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import "LJOAuthControllerViewModel.h"
#import "LJNetworkTool.h"
#import "LJAccountInfo.h"



@implementation LJOAuthControllerViewModel
+ (instancetype)sharedViewModel{
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[LJOAuthControllerViewModel alloc] init];
        
    });
    
    return instance;
}

// 为了解档，重写init方法
- (instancetype)init{
    if (self = [super init]) {
        self.accountInfo = [self getAccountInfo];
    }
    return self;
}

- (void)getAccountInfoWithCode:(NSString *)code finished:(void (^)(BOOL))finished{
    
    [[LJNetworkTool sharedTool] getAccountWithCode:code success:^(id response) {
        
        NSDictionary *dict = (NSDictionary *)response;
        
//        NSLog(@"response:%@",dict);
        
        self.accountInfo = [LJAccountInfo accountInfoWithDict:dict];
        
        self.accountInfo.expires_date = [NSDate dateWithTimeIntervalSinceNow:self.accountInfo.expires_in.doubleValue];
        
        [self getAccountIconWithAccountInfo:self.accountInfo finished:finished];
        
    } failure:^(NSError *error) {
        
        NSLog(@"getAccountInfoWithCode error:%@",error);
        finished(NO);
        
    }];
    
    
}

- (void)getAccountIconWithAccountInfo:(LJAccountInfo *)accountInfo finished:(void (^)(BOOL))finished{
    [[LJNetworkTool sharedTool] getAccountIconWithAccountInfo:accountInfo success:^(id response) {
        
        NSDictionary *dict = (NSDictionary *)response;
        
        self.accountInfo.screen_name = dict[@"screen_name"];
        self.accountInfo.avatar_large = dict[@"avatar_large"];
        
        [self saveAccountInfo];
        
        if (finished) {
            finished(YES);
        }
        
    } failure:^(NSError *error) {
        
        NSLog(@"getAccountIconWithAccountInfo error:%@",error);
    }];
}


#pragma mark - 模型归档
- (void)saveAccountInfo{

    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"account.archiver"];
    
    [NSKeyedArchiver archiveRootObject:self.accountInfo toFile:filePath];
}

#pragma mark - 解档模型
- (LJAccountInfo *)getAccountInfo{
    
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"account.archiver"];
    
    return [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
}

#pragma mark - 重写getter方法
- (NSString *)access_token{
    if (self.accountInfo.access_token.length) {
        
        NSDate *currentDate = [NSDate date];
        
        NSComparisonResult result = [self.accountInfo.expires_date compare:currentDate];
        
        // 过期了，返回nil
        if (result == NSOrderedDescending) {
            return self.accountInfo.access_token;
        }else{
            return nil;
        }
    }else{
        return nil;
    }
}

- (BOOL)isLogin{
    
    return self.access_token != nil;
}



@end
