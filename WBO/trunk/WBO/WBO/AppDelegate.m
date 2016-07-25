//
//  AppDelegate.m
//  WBO
//
//  Created by JackLou on 7/20/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import "AppDelegate.h"
#import "LJMainController.h"
#import "LJWelcomeController.h"
#import "LJOAuthControllerViewModel.h"
#import "LJNewFeatureController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setupTabBar];
    
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [self setDefaultRootVc];
//    _window.rootViewController = [LJNewFeatureController new];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(switchRootVc:) name:kSwitchRootVcNotification object:nil];
    
    [_window makeKeyAndVisible];
    return YES;
}

- (void)setupTabBar{
    [UITabBar appearance].tintColor = [UIColor orangeColor];
}

#pragma mark - 设置默认根控制器
- (void)setDefaultRootVc{
    
    NSString *versionKey = @"versionKey";
    
    NSString *newVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    
    NSString *oldVersion = [[NSUserDefaults standardUserDefaults] valueForKey:versionKey];
    
    NSComparisonResult result = [newVersion compare:oldVersion];
    
    if ([LJOAuthControllerViewModel sharedViewModel].isLogin) {
        
        if (result == NSOrderedDescending) {
            self.window.rootViewController = [LJNewFeatureController new];
            
            [[NSUserDefaults standardUserDefaults] setValue:newVersion forKey:versionKey];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }else{
            
            self.window.rootViewController = [LJWelcomeController new];
        }
        
    }else{
        if (result == NSOrderedDescending) {
            
            self.window.rootViewController = [LJNewFeatureController new];
            
            [[NSUserDefaults standardUserDefaults] setValue:newVersion forKey:versionKey];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
        }else{
        
            self.window.rootViewController = [LJMainController new];
        }
        
    }
}

#pragma mark - 切换根控制器的通知方法
- (void)switchRootVc:(NSNotification *)noti{
    
    if (noti.object) {
        
        self.window.rootViewController = [LJMainController new];
    }else{
        if ([LJOAuthControllerViewModel sharedViewModel].isLogin) {
            
            self.window.rootViewController = [LJWelcomeController new];
        }else {
            self.window.rootViewController = [LJMainController new];
        }
        
    }
    
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kSwitchRootVcNotification object:nil];
}

@end
