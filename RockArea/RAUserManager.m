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
+(void)registerUserWithMail:(NSString *)email pwd:(NSString *)pwd repHandler:(void(^)(RAUser *user,RAError * error))repHander
{
    RAUser *newUser = [[RAUser alloc]init];
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
+(void)loginWithUserName:(NSString *)userName pwd:(NSString *)pwd repHandler:(void(^)(RAUser *user,RAError *error))repHander
{
    [RAUser loginWithUsernameInBackground:userName password:pwd block:^(RAUser *user, NSError *error) {
        repHander(user,(RAError *)error);
    }];
}

#pragma mark - 注销
+(void)logout
{
    [RAUser logout];
}

#pragma mark - 找回密码
+(void)findPwd:(NSString *)pwd
{
    [RAUser requestPasswordResetInBackgroundWithEmail:pwd];
}

@end
