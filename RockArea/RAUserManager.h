//
//  RAUserManager.h
//  RockArea
//
//  Created by YongCheHui on 15/3/25.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BmobUser+RAUser.h"

/**
 *  用户管理
 */
@interface RAUserManager : NSObject

#pragma mark - 注册用户
/**
 *  用户名
 *
 *  @param email     邮箱
 *  @param pwd       密码
 *  @param repHander 返回回调
 */
+(void)registerUserWithMail:(NSString *)email pwd:(NSString *)pwd repHandler:(void(^)(BmobUser *user,RAError *error))repHander;


#pragma mark - 登陆
/**
 *  登陆
 *
 *  @param userName  用户名（邮箱）
 *  @param pwd       密码
 *  @param repHander 返回回调
 */
+(void)loginWithUserName:(NSString *)userName pwd:(NSString *)pwd repHandler:(void(^)(BmobUser *user,RAError *error))repHander;

#pragma mark - 注销
+(void)logout;

#pragma mark - 找回密码
+(void)findPwd:(NSString *)pwd;
@end
