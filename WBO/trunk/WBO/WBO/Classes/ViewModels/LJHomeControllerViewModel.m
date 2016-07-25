//
//  LJHomeControllerViewModel.m
//  WBO
//
//  Created by JackLou on 7/24/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import "LJHomeControllerViewModel.h"
#import "LJNetworkTool.h"
#import "LJOAuthControllerViewModel.h"
#import "LJHomeCellViewModel.h"

@implementation LJHomeControllerViewModel
- (void)getStatusListWithAccountInfo:(LJAccountInfo *)accountInfo finished:(void (^)(BOOL))finished{
    
    [[LJNetworkTool sharedTool] getStatusListWithAccountInfo:[LJOAuthControllerViewModel sharedViewModel].accountInfo success:^(NSDictionary *response) {
        
        NSArray *statuses = response[@"statuses"];
        
        NSMutableArray *mArray = [NSMutableArray array];
        for (NSDictionary *dict in statuses) {
            LJStatusInfo *statusInfo = [LJStatusInfo statusInfoWithDict:dict];
            
            LJHomeCellViewModel *homeCellViewModel = [[LJHomeCellViewModel alloc] initWithStatusInfo:statusInfo];
            
            [mArray addObject:homeCellViewModel];
        }
        
        self.statusList = mArray.copy;
        
        if (finished) {
            finished(YES);
        }
        
        
    } failure:^(NSError *error) {
        
        NSLog(@"getStatusInfoWithAccountInfo error:%@",error);
        if (finished) {
            finished(NO);
        }
        
    }];
    
}
@end
