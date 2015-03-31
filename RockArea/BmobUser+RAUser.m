//
//  RAUser.m
//  RockArea
//
//  Created by YongCheHui on 15/3/25.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import "BmobUser+RAUser.h"
@implementation BmobUser(RAUser)
static NSString* const ra_user_nickNameKey = @"nickName";
static NSString* const ra_user_ageKey = @"age";
static NSString* const ra_user_sexKey = @"sex";
static NSString* const ra_user_cityKey = @"city";
static NSString* const ra_user_avatorKey = @"avator";
static NSString* const ra_user_occupKey = @"occupation";

static NSString* const ra_user_wxKey = @"wxID";

static NSString* const ra_user_favorBandsKey = @"favorBands";
static NSString* const ra_user_tagsKey = @"tags";
static NSString* const ra_user_favorStylesKey = @"favorStyles";
static NSString* const ra_user_favorInstrumentsKey = @"favorInstruments";

static NSString* const ra_user_geoPointKey = @"geoPoint";

static NSString* const ra_user_favorUsersKey = @"favorUsers";
static NSString* const ra_user_favorMCsKey = @"favorMCs";
static NSString* const ra_user_favorLifesKey = @"favorLifes";

#pragma mark 基本信息
-(void)setNickName:(NSString *)nickName
{
    [self setObject:nickName forKey:ra_user_nickNameKey];
}

-(NSString *)nickName
{
    return [self objectForKey:ra_user_nickNameKey];
}

-(void)setAge:(int)age
{
    [self setInt:age forKey:ra_user_ageKey];
}

-(int)age
{
    return [self intforKey:ra_user_ageKey];
}

-(void)setSex:(BOOL)sex
{
    [self setBool:sex forKey:ra_user_sexKey];
}

-(BOOL)sex
{
    return [self boolForKey:ra_user_sexKey];
}

-(void)setCity:(int)city
{
    [self setInt:city forKey:ra_user_cityKey];
}

-(int)city
{
    return [self intforKey:ra_user_cityKey];
}

-(void)setAvator:(BmobFile *)avator
{
    [self setObject:avator forKey:ra_user_avatorKey];
}

-(BmobFile *)avator
{
   return [self objectForKey:ra_user_avatorKey];
}


-(void)setOccupation:(NSString *)occupation
{
    [self setObject:occupation forKey:ra_user_occupKey];
}

-(NSString *)occupation
{
    return [self objectForKey:ra_user_occupKey];
}

-(void)setWxID:(NSString *)wxID
{
    [self setObject:wxID forKey:ra_user_wxKey];
}

-(NSString *)wxID
{
    return [self objectForKey:ra_user_wxKey];
}
#pragma mark 其他信息
-(void)setFavorBands:(NSString *)bands
{
    [self setObject:bands forKey:ra_user_favorBandsKey];
}

-(NSString *)favorBands
{
    return [self objectForKey:ra_user_favorBandsKey];
}

-(void)setFavorInstruments:(NSString *)instruments
{
    [self setObject:instruments forKey:ra_user_favorInstrumentsKey];
}

-(NSString *)favorInstruments
{
    return [self objectForKey:ra_user_favorInstrumentsKey];
}

-(void)setFavorStyles:(NSString *)styles
{
    [self setObject:styles forKey:ra_user_favorStylesKey];
}

-(NSString *)favorStyles
{
    return [self objectForKey:ra_user_favorStylesKey];
}

-(void)setTags:(NSString *)tags
{
    [self setObject:tags forKey:ra_user_tagsKey];
}

-(NSString *)tags
{
    return [self objectForKey:ra_user_tagsKey];
}

-(void)setGeoPoint:(BmobGeoPoint *)geoPoint
{
    [self setObject:geoPoint forKey:ra_user_geoPointKey];
}
-(BmobGeoPoint *)geoPoint
{
    return [self objectForKey:ra_user_geoPointKey];
}

//-(void)setFavorLifes:(BmobRelation *)favorLifes
//{
//    [self setObject:favorLifes forKey:ra_user_favorLifesKey];
//}
//
//-(BmobRelation *)favorLifes
//{
//    return [self objectForKey:ra_user_favorLifesKey];
//}
//
//-(void)setFavorMCs:(BmobRelation *)favorMCs
//{
//    [self setObject:favorMCs forKey:ra_user_favorMCsKey];
//}
//
//-(BmobRelation *)favorMCs
//{
//    return [self objectForKey:ra_user_favorMCsKey];
//}
//
//-(void)setFavorUsers:(BmobRelation *)favorUsers
//{
//    [self setObject:favorUsers forKey:ra_user_favorUsersKey];
//}
//
//-(BmobRelation *)favorUsers
//{
//    return [self objectForKey:ra_user_favorUsersKey];
//}
@end
