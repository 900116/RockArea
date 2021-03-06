//
//  RADataConfig.h
//  RockArea
//
//  Created by YongCheHui on 15/3/25.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BmobSDK/Bmob.h>
#import "BmobUser+RAUser.h"
#define RASelfNavi self.navigationController

#pragma mark 各种key 
static NSString* const raApplicationID = @"9e69b4bbbcb6954848c9eb8c7bbd4ac5";
static NSString* const raRestAPIKey = @"af9a3909cd067256a868280e274dc213";
static NSString* const raMasterKey = @"fd9bbf000ce027d55cb3e74cbb05f0d1";
static NSString* const raAccessKey = @"0cec66c6deef4968f64307b91b0ab9b3";
static NSString* const raSecretKey = @"1d572569fd54a304";
static NSString* const raObjIDKey = @"objectId";

#pragma mark 模型名称
static NSString* const raUserModelName = @"User";
static NSString* const raSytemConfigModelName = @"SystemConfig";
static NSString* const raStylesModelName = @"Styles";
static NSString* const raInstumentsModelName = @"Instruments";
static NSString* const raLifeModelName = @"Life";
static NSString* const raLifeCommentModelName = @"LifeComment";

#pragma mark 通知key
static NSString* const RALoginSuccessNotificationKey = @"loginSuccess";

#pragma mark block
typedef void(^FinishArrayHandler)(NSArray * results,NSError * error);
typedef void(^FinishBoolHandler)(BOOL isSuccess,NSError * error);
typedef void(^FinishStringHandler)(NSString * string,NSError * error);
typedef void(^FinishUploadImageHandler)(NSArray * urls,NSArray *sizes,NSError * error);
typedef void(^FinishUserHandler)(RAUser* user,NSError * error);
typedef void(^FinishVoidHandler)();

#pragma mark inline
static inline NSUserDefaults* RAUserDefaulter()
{
    return [NSUserDefaults standardUserDefaults];
}

static inline RAUser* CurrUser()
{
    return [RAUser getCurrentUser];
}

static inline NSNotificationCenter* RANotificationCenter()
{
    return [NSNotificationCenter defaultCenter];
}

@interface RADataConfig : NSObject
/**
 *  比目云配置
 */
+(void)BombConfig;

/**
 *  单例
 *
 *  @return 单例
 */
+(instancetype)getInstance;
@end
