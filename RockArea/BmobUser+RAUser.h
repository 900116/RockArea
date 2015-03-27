//
//  RAUser.h
//  RockArea
//
//  Created by YongCheHui on 15/3/25.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BmobSDK/BmobUser.h>

@interface BmobUser(RAUser)
#pragma mark 基本信息

//昵称
-(void)setNickName:(NSString *)nickName;
-(NSString *)nickName;

//性别
-(void)setSex:(BOOL)sex;
-(BOOL)sex;

//年龄
-(void)setAge:(int)age;
-(int)age;

//城市
-(void)setCity:(int)city;
-(int)city;

//头像
-(void)setAvator:(BmobFile *)avator;
-(BmobFile *)avator;

//微信ID
-(void)setWxID:(NSString *)wxID;
-(NSString *)wxID;

//职业
-(void)setOccupation:(NSString *)occupation;
-(NSString *)occupation;

#pragma mark 其他信息
//喜欢的乐器
-(void)setFavorInstruments:(NSString *)instruments;
-(NSString *)favorInstruments;

//喜欢的乐队或歌手
-(void)setFavorBands:(NSString *)bands;
-(NSString *)favorBands;

//风格
-(void)setFavorStyles:(NSString *)styles;
-(NSString *)favorStyles;

//给自己的标签
-(void)setTags:(NSString *)tags;
-(NSString *)tags;

//经度
-(void)setGeoPoint:(BmobGeoPoint *)geoPoint;
-(BmobGeoPoint *)geoPoint;

//收藏的圈子
-(void)setFavorLifes:(BmobRelation *)favorLifes;
-(BmobRelation *)favorLifes;

//收藏的乐评
-(void)setFavorMCs:(BmobRelation *)favorMCs;
-(BmobRelation *)favorMCs;

//收藏的人
-(void)setFavorUsers:(BmobRelation *)favorUsers;
-(BmobRelation *)favorUsers;
@end
typedef BmobUser RAUser;
