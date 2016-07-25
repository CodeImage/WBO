//
//  LJAccountInfo.h
//  WBO
//
//  Created by JackLou on 7/24/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJAccountInfo : NSObject <NSCoding>

@property (nonatomic,copy) NSString *access_token;
@property (nonatomic,strong) NSNumber *expires_in;
@property (nonatomic,strong) NSDate *expires_date;
// 被废弃
//@property (nonatomic,copy) NSString *remind_in;
@property (nonatomic,copy) NSString *uid;

// 后面请求获取的账号信息，跟上面的合并在同一个模型中
@property (nonatomic,copy) NSString *screen_name;
@property (nonatomic,copy) NSString *avatar_large;


+ (instancetype)accountInfoWithDict:(NSDictionary *)dict;
@end
