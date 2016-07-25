//
//  LJNetworkTool.h
//  WBO
//
//  Created by JackLou on 7/24/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "LJAccountInfo.h"

typedef NS_ENUM(NSInteger,RequestType) {
    
    RequestTypeGET,
    RequestTypePOST
    
};

@interface LJNetworkTool : AFHTTPSessionManager
+ (instancetype)sharedTool;

- (void)requestWithType:(RequestType) type urlString: (NSString *)urlString parameters:(id) paramaters success:(void(^)(id response))success failure:(void(^)(NSError *error))failure;

- (void)getAccountWithCode:(NSString *)code success:(void(^)(id response))success failure:(void(^)(NSError *error))failure;

- (void)getAccountIconWithAccountInfo:(LJAccountInfo *)accountInfo success:(void(^)(id response))success failure:(void(^)(NSError *error))failure;


- (void)getStatusListWithAccountInfo:(LJAccountInfo *)accountInfo success:(void(^)(id response))success failure:(void(^)(NSError *error))failure;
@end
