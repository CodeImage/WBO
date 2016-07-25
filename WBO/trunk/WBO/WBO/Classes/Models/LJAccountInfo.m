//
//  LJAccountInfo.m
//  WBO
//
//  Created by JackLou on 7/24/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import "LJAccountInfo.h"

@implementation LJAccountInfo

+ (instancetype)accountInfoWithDict:(NSDictionary *)dict{
    
    LJAccountInfo *accountInfo = [[self alloc] init];
    [accountInfo setValuesForKeysWithDictionary:dict];
    
    return accountInfo;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{

}

#pragma mark - 归档
- (void)encodeWithCoder:(NSCoder *)aCoder{

    [aCoder encodeObject:self.access_token forKey:kAccess_token];
    [aCoder encodeObject:self.expires_date forKey:kExpires_date];
    [aCoder encodeObject:self.uid forKey:kUid];
    [aCoder encodeObject:self.screen_name forKey:kScreen_name];
    [aCoder encodeObject:self.avatar_large forKey:kAvatar_large];
    
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        
        self.access_token = [aDecoder decodeObjectForKey:kAccess_token];
        self.expires_date = [aDecoder decodeObjectForKey:kExpires_date];
        self.uid = [aDecoder decodeObjectForKey:kUid];
        self.screen_name = [aDecoder decodeObjectForKey:kScreen_name];
        self.avatar_large = [aDecoder decodeObjectForKey:kAvatar_large];
    }
    
    
    return self;
}

@end
