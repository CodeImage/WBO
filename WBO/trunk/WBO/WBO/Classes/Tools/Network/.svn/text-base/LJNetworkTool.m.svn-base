//
//  LJNetworkTool.m
//  WBO
//
//  Created by JackLou on 7/24/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import "LJNetworkTool.h"

@implementation LJNetworkTool
+ (instancetype)sharedTool{
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[LJNetworkTool alloc] init];
        
    });
    
    return instance;
}

- (void)requestWithType:(RequestType)type urlString:(NSString *)urlString parameters:(id)paramaters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    
    self.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"text/plain",@"application/json"]];
    
    if (type == RequestTypeGET) {
        [self GET:urlString parameters:paramaters progress:^(NSProgress * _Nonnull progress) {
            
        
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            if (success) {
                success(responseObject);
            }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            if (failure) {
                failure(error);
            }
        }];
    }else{
        [self POST:urlString parameters:paramaters progress:^(NSProgress * _Nonnull progress) {
            
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            if (success) {
                success(responseObject);
            }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            if (failure) {
                failure(error);
            }
        }];
    }
    
}


#pragma mark - 请求用户信息接口
- (void)getAccountWithCode:(NSString *)code success:(void(^)(id response))success failure:(void(^)(NSError *error))failure{
    
    // http://open.weibo.com/wiki/OAuth2/access_token查看的请求格式
    
    NSString *urlString = @"https://api.weibo.com/oauth2/access_token";
    
    NSDictionary *dict = @{@"client_id":kAppKey, @"client_secret":kAppSecret, @"grant_type": @"authorization_code", @"code":code, @"redirect_uri": kRedirectUri};
    
    /*
     
     必选	类型及范围	说明
     client_id	true	string	申请应用时分配的AppKey。
     client_secret	true	string	申请应用时分配的AppSecret。
     grant_type	true	string	请求的类型，填写authorization_code
     
     grant_type为authorization_code时
     必选	类型及范围	说明
     code	true	string	调用authorize获得的code值。
     redirect_uri	true	string	回调地址，需需与注册应用里的回调地址一致。
     */
    
    [self requestWithType:RequestTypePOST urlString:urlString parameters:dict success:success failure:failure];
    
    
}

#pragma mark - 请求账号头像、昵称接口
- (void)getAccountIconWithAccountInfo:(LJAccountInfo *)accountInfo success:(void(^)(id response))success failure:(void(^)(NSError *error))failure{
    
    
    // http://open.weibo.com/wiki/2/users/show 此处查看的请求格式
    
    NSString *urlString = @"https://api.weibo.com/2/users/show.json";
    
    // 此处官方文档，参数uid不是必须的，但实际上是必须的，否则请求失败
    // 参数uid与screen_name二者必选其一，且只能选其一；
    NSDictionary *dict = @{@"access_token":accountInfo.access_token, @"uid":accountInfo.uid};
    
    [self requestWithType:RequestTypeGET urlString:urlString parameters:dict success:success failure:failure];
    
    
}

#pragma mark - 请求首页关注账号的动态
- (void)getStatusListWithAccountInfo:(LJAccountInfo *)accountInfo success:(void(^)(id response))success failure:(void(^)(NSError *error))failure{
    
    // http://open.weibo.com/wiki/2/statuses/friends_timeline 文档查看的请求格式
    
    NSString *urlString = @"https://api.weibo.com/2/statuses/friends_timeline.json";
    
    NSDictionary *dict = @{
                           @"access_token": accountInfo.access_token
                           };
    
    [self requestWithType:RequestTypeGET urlString:urlString parameters:dict success:success failure:failure];
}

@end
