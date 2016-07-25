//
//  LJStatusInfo.h
//  WBO
//
//  Created by JackLou on 7/25/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LJUserInfo.h"

@interface LJStatusInfo : NSObject
@property (nonatomic,copy) NSString *created_at;
@property (nonatomic,copy) NSNumber *user_id;
@property (nonatomic,copy) NSString *text;
@property (nonatomic,copy) NSString *source;
@property (nonatomic,strong) LJUserInfo *user;

@property (nonatomic,strong) LJStatusInfo *retweeted_status;



+ (instancetype)statusInfoWithDict:(NSDictionary *)dict;

@end
