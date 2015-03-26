//
//  RADataConfig.m
//  RockArea
//
//  Created by YongCheHui on 15/3/25.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import "RADataConfig.h"
#import "SystemConfig.h"

@implementation RADataConfig
+(void)BombConfig
{
    //注册比目云
    [Bmob registerWithAppKey:raApplicationID];
    [SystemConfig getInstance];
}

+(instancetype)getInstance
{
    static dispatch_once_t onceToken;
    static RADataConfig *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}
@end
 