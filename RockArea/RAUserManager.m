//
//  RAUserManager.m
//  RockArea
//
//  Created by YongCheHui on 15/3/25.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import "RAUserManager.h"

@implementation RAUserManager
#pragma mark - 注册
+(void)registerUserWithMail:(NSString *)email pwd:(NSString *)pwd repHandler:(void(^)(BmobUser *user,RAError * error))repHander
{
    BmobUser *newUser = [[BmobUser alloc]init];
    [newUser setUserName:email];
    [newUser setEmail:email];
    [newUser setPassword:pwd];
    [newUser signUpInBackgroundWithBlock:^(BOOL isSuccessful, NSError *error) {
        if (!isSuccessful) {
            repHander(nil,(RAError *)error);
        }
        else
        {
            repHander(newUser,(RAError *)error);
        }
    }];
}

#pragma mark - 登陆
+(void)loginWithUserName:(NSString *)userName pwd:(NSString *)pwd repHandler:(void(^)(BmobUser *user,RAError *error))repHander
{
    [BmobUser loginWithUsernameInBackground:userName password:pwd block:^(BmobUser *user, NSError *error) {
        repHander(user,(RAError *)error);
    }];
}

#pragma mark - 注销
+(void)logout
{
    [BmobUser logout];
}

#pragma mark - 找回密码
+(void)findPwd:(NSString *)pwd
{
    [BmobUser requestPasswordResetInBackgroundWithEmail:pwd];
}

@end
