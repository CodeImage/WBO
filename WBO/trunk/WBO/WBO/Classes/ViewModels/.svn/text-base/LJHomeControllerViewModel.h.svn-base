//
//  LJHomeControllerViewModel.h
//  WBO
//
//  Created by JackLou on 7/24/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LJAccountInfo.h"
#import "LJStatusInfo.h"
#import "LJHomeCellViewModel.h"

@interface LJHomeControllerViewModel : NSObject

@property (nonatomic,strong) NSArray<LJHomeCellViewModel *> *statusList;

- (void)getStatusListWithAccountInfo:(LJAccountInfo *)accountInfo finished:(void(^)(BOOL isSuccess)) finished;
@end
