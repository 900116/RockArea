//
//  RAUser.m
//  RockArea
//
//  Created by YongCheHui on 15/3/25.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import "BmobUser+RAUser.h"
@implementation BmobUser(RAUser)
#pragma mark 基本信息
-(void)setNickName:(NSString *)nickName
{
    [self setObject:nickName forKey:@"nickName"];
}

-(NSString *)nickName
{
    return [self objectForKey:@"nickName"];
}

-(void)setAge:(int)age
{
    [self setInt:age forKey:@"age"];
}

-(int)age
{
    return [self intforKey:@"age"];
}

-(void)setSex:(BOOL)sex
{
    [self setBool:sex forKey:@"sex"];
}

-(BOOL)sex
{
    return [self boolForKey:@"sex"];
}

-(void)setCity:(int)city
{
    [self setInt:city forKey:@"city"];
}

-(int)city
{
    return [self intforKey:@"city"];
}

-(void)setAvator:(BmobFile *)avator
{
    [self setObject:avator forKey:@"avator"];
}

-(BmobFile *)avator
{
   return [self objectForKey:@"avator"];
}


-(void)setOccupation:(NSString *)occupation
{
    [self setObject:occupation forKey:@"occupation"];
}

-(NSString *)occupation
{
    return [self objectForKey:@"occupation"];
}

-(void)setWxID:(NSString *)wxID
{
    [self setObject:wxID forKey:@"wxID"];
}

-(NSString *)wxID
{
    return [self objectForKey:@"wxID"];
}
#pragma mark 其他信息
-(void)setFavorBands:(NSString *)bands
{
    [self setObject:bands forKey:@"favorBands"];
}

-(NSString *)favorBands
{
    return [self objectForKey:@"favorBands"];
}

-(void)setFavorInstruments:(NSString *)instruments
{
    [self setObject:instruments forKey:@"favorInstruments"];
}

-(NSString *)favorInstruments
{
    return [self objectForKey:@"favorInstruments"];
}

-(void)setFavorStyles:(NSString *)styles
{
    [self setObject:styles forKey:@"favorStyles"];
}

-(NSString *)favorStyles
{
    return [self objectForKey:@"favorStyles"];
}

-(void)setTags:(NSString *)tags
{
    [self setObject:tags forKey:@"tags"];
}

-(NSString *)tags
{
    return [self objectForKey:@"tags"];
}
@end
