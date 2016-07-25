//
//  LJUserInfo.h
//  WBO
//
//  Created by JackLou on 7/25/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJUserInfo : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *profile_image_url;
@property (nonatomic,copy) NSString *gender;
@property (nonatomic,copy) NSNumber *verified_type;
@property (nonatomic,copy) NSString *mbrank;

+ (instancetype)userInfoWithDict:(NSDictionary *)dict;
@end
