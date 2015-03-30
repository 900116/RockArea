//
//  RALifeModel.m
//  RockArea
//
//  Created by YongCheHui on 15/3/27.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import "RALifeModel.h"
static NSString* const ra_life_textKey = @"text";
static NSString* const ra_life_userKey = @"user";
static NSString* const ra_life_typeKey = @"type";
static NSString* const ra_life_audioKey = @"audio";
static NSString* const ra_life_imagesKey = @"images";
static NSString* const ra_life_imageSizesKey = @"imageSizes";
static NSString* const ra_life_admirCountKey = @"admireCount";
static NSString* const ra_life_commentCountKey = @"commitCount";
static NSString* const ra_life_admiresKey = @"admires";
static NSString* const ra_life_commentsKey = @"comments";
@implementation RALifeModel

+(id)newLife
{
    RALifeModel *model = [super newObject];
    [model setClassName:raLifeModelName];
    return model;
}

-(void)setText:(NSString *)text
{
    [self setObject:text forKey:ra_life_textKey];
}

-(NSString *)text
{
    return [self objectForKey:ra_life_textKey];
}

-(void)setSendUser:(BmobRelation *)sendUser
{
    [self addRelation:sendUser ForKey:ra_life_userKey];
}

-(BmobRelation *)sendUser
{
    return [self objectForKey:ra_life_userKey];
}

-(void)setContentType:(RALifeContentType)contentType
{
    [self setInt:contentType forKey:ra_life_typeKey];
}

-(RALifeContentType)contentType
{
    return [self intForKey:ra_life_typeKey];
}

-(void)setAudio:(BmobFile *)audio
{
    [self setObject:audio forKey:ra_life_audioKey];
}

-(BmobFile *)audio
{
    return [self objectForKey:ra_life_audioKey];
}

-(void)setImages:(NSArray *)images
{
    [self setObject:images forKey:ra_life_imagesKey];
}

-(NSArray *)images
{
    return [self objectForKey:ra_life_imagesKey];
}

-(void)setImageSizes:(NSArray *)imageSizes
{
    [self setObject:imageSizes forKey:ra_life_imageSizesKey];
}

-(NSArray *)imageSizes
{
    return [self objectForKey:ra_life_imageSizesKey];
}

-(void)setAdmires:(BmobRelation *)admires
{
    [self addRelation:admires ForKey:ra_life_admiresKey];
}

-(BmobRelation *)admires
{
    return [self objectForKey:ra_life_admiresKey];
}

-(void)setComments:(BmobRelation *)comments
{
    [self addRelation:comments ForKey:ra_life_commentsKey];
}

-(BmobRelation *)comments
{
    return [self objectForKey:ra_life_commentsKey];
}

-(void)setAdmireCount:(int)admireCount
{
    [self setInt:admireCount forKey:ra_life_admirCountKey];
}

-(int)admireCount
{
    return [self intForKey:ra_life_admirCountKey];
}

-(void)setCommentCount:(int)commentCount
{
    [self setInt:commentCount forKey:ra_life_commentCountKey];
}

-(int)commentCount
{
    return [self intForKey:ra_life_commentCountKey];
}
@end
