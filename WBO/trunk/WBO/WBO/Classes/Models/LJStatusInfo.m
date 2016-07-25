//
//  LJStatusInfo.m
//  WBO
//
//  Created by JackLou on 7/25/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import "LJStatusInfo.h"

@implementation LJStatusInfo
+ (instancetype)statusInfoWithDict:(NSDictionary *)dict{
    LJStatusInfo *statusInfo = [[self alloc] init];
    
    [statusInfo setStatusWithDict:dict];
    
    
    return statusInfo;
    
}


// 由于属性user_id与字典的key id不同，所以只能挨个赋值
- (void)setStatusWithDict:(NSDictionary *)dict{
    
    self.created_at = dict[@"created_at"];
    self.user_id = dict[@"id"];
    self.text = dict[@"text"];
    self.source = dict[@"source"];
    self.user = [LJUserInfo userInfoWithDict:dict[@"user"]];
    
    if (dict[@"retweeted_status"]) {
        
        self.retweeted_status = [LJStatusInfo statusInfoWithDict:dict[@"retweeted_status"]];
    }
    
}



@end
