//
//  RALifeComment.m
//  RockArea
//
//  Created by YongCheHui on 15/3/31.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import "RALifeComment.h"
static NSString* const ra_lc_textKey = @"text";
static NSString* const ra_lc_typeKey = @"type";
static NSString* const ra_lc_sendUserKey = @"sendUserID";
static NSString* const ra_lc_orignUserKey = @"orginUserID";
@implementation RALifeComment
+(id)newObject
{
    RALifeComment *model = [super newObject];
    model.sendUserID = CurrUser().objectId;
    return model;
}

+(NSString *)className
{
    return raLifeCommentModelName;
}

#pragma mark - Base
-(void)setText:(NSString *)text
{
    [self setObject:text forKey:ra_lc_textKey];
}

-(NSString *)text
{
    return [self objectForKey:ra_lc_textKey];
}

-(void)setType:(RACommentType)type
{
    [self setInt:type forKey:ra_lc_typeKey];
}

-(RACommentType)type
{
    return [self intForKey:ra_lc_typeKey];
}

-(void)setSendUserID:(NSString *)sendUserID
{
    [self setObject:sendUserID forKey:ra_lc_sendUserKey];
}

-(NSString *)sendUserID
{
    return [self objectForKey:ra_lc_sendUserKey];
}

-(void)setOrignUserID:(NSString *)orignUserID
{
    [self setObject:orignUserID forKey:ra_lc_orignUserKey];
}

-(NSString *)orignUserID
{
    return [self objectForKey:ra_lc_orignUserKey];
}
@end
