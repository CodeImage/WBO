//
//  LJUserInfo.m
//  WBO
//
//  Created by JackLou on 7/25/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import "LJUserInfo.h"

@implementation LJUserInfo
+ (instancetype)userInfoWithDict:(NSDictionary *)dict{
    LJUserInfo *userInfo = [[self alloc] init];
    [userInfo setValuesForKeysWithDictionary:dict];
    
    return userInfo;
    
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{

}
@end
