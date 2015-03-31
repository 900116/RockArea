//
//  RALifeModel.m
//  RockArea
//
//  Created by YongCheHui on 15/3/27.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import "RALifeModel.h"
#import "BmobUser+RAUser.h"
#define WS(weakSelf) __weak __typeof(&*self)weakSelf = self

static NSString* const ra_life_textKey = @"text";
static NSString* const ra_life_userKey = @"userid";
static NSString* const ra_life_typeKey = @"type";
static NSString* const ra_life_audioKey = @"audio";
static NSString* const ra_life_imagesKey = @"images";
static NSString* const ra_life_imageSizesKey = @"imageSizes";
static NSString* const ra_life_admirCountKey = @"admireCount";
static NSString* const ra_life_commentCountKey = @"commitCount";
static NSString* const ra_life_admiresKey = @"admires";
static NSString* const ra_life_commentsKey = @"comments";

@interface RALifeModel ()
{
    RAUser *_sendUser;
}
@end

@implementation RALifeModel

+(id)newObject
{
    RALifeModel *model = [super newObject];
    model.usrID = CurrUser().objectId;
    return model;
}

+(NSString *)className
{
    return raLifeModelName;
}

+(BmobQuery *)lifeQuery
{
    __autoreleasing BmobQuery *bq = [BmobQuery queryWithClassName:raLifeModelName];
    return bq;
}

#pragma mark - Base
#pragma mark 内容
-(void)setText:(NSString *)text
{
    [self setObject:text forKey:ra_life_textKey];
}

-(NSString *)text
{
    return [self objectForKey:ra_life_textKey];
}

#pragma mark 内容类型
-(void)setContentType:(RALifeContentType)contentType
{
    [self setInt:contentType forKey:ra_life_typeKey];
}

-(RALifeContentType)contentType
{
    return [self intForKey:ra_life_typeKey];
}

#pragma mark 音频文件
-(void)setAudio:(BmobFile *)audio
{
    [self setObject:audio forKey:ra_life_audioKey];
}

-(BmobFile *)audio
{
    return [self objectForKey:ra_life_audioKey];
}

#pragma mark 图片
-(void)setImages:(NSArray *)images
{
    [self setObject:images forKey:ra_life_imagesKey];
}

-(NSArray *)images
{
    return [self objectForKey:ra_life_imagesKey];
}

#pragma mark 图片尺寸
-(void)setImageSizes:(NSArray *)imageSizes
{
    [self setObject:imageSizes forKey:ra_life_imageSizesKey];
}

-(NSArray *)imageSizes
{
    return [self objectForKey:ra_life_imageSizesKey];
}

-(void)setUsrID:(NSString *)usrID
{
    [self setObject:usrID forKey:ra_life_userKey];
}

-(NSString *)usrID
{
    return [self objectForKey:ra_life_userKey];
}

#pragma mark 赞数量
-(void)setAdmireCount:(int)admireCount
{
    [self setInt:admireCount forKey:ra_life_admirCountKey];
}

-(int)admireCount
{
    return [self intForKey:ra_life_admirCountKey];
}

#pragma mark 评论数
-(void)setCommentCount:(int)commentCount
{
    [self setInt:commentCount forKey:ra_life_commentCountKey];
}

-(int)commentCount
{
    return [self intForKey:ra_life_commentCountKey];
}

#pragma mark - Relation
#pragma mark 发送者
-(void)findSendUser
{
    NSString *userID = self.usrID;
    BmobQuery *bq = [BmobQuery queryForUser];
    [bq getObjectInBackgroundWithId:userID block:^(BmobObject *object, NSError *error) {
        if (object) {
            _sendUser = (BmobUser *)object;
        }
    }];
}

-(RAUser *)sendUser
{
    return _sendUser;
}

#pragma mark 赞
-(void)detectIsAdmire:(FinishVoidHandler)handler
{
    //查找是否赞过
    __weak typeof(self) weakSelf = self;
    BmobQuery *bquery = [BmobQuery queryWithClassName:raLifeModelName];
    NSDictionary *dic = @{ra_life_admiresKey:@{@"$inQuery":@{@"where":@{raObjIDKey:CurrUser().objectId},@"className":@"_User"}}, raObjIDKey:self.bObj.objectId};
    [bquery queryWithAllConstraint:dic];
    [bquery countObjectsInBackgroundWithBlock:^(int number, NSError *error) {
        if (number > 0) {
            weakSelf.isAdimre = YES;
        }
        else
        {
            weakSelf.isAdimre = NO;
        }
        handler();
    }];
}

-(void)admireAction
{
    self.admireCount++;
    BmobRelation *relation = [BmobRelation relation];
    [relation addObject:CurrUser()];
    [self addRelation:relation ForKey:ra_life_admiresKey];
    [self updateInBackground];
}

-(void)unAdmireAction
{
    self.admireCount--;
    BmobRelation *relation = [BmobRelation relation];
    [relation removeObject:CurrUser()];
    [self addRelation:relation ForKey:ra_life_admiresKey];
    [self updateInBackground];
}

-(BmobRelation *)comments
{
    return [self objectForKey:ra_life_commentsKey];
}

-(void)setComments:(BmobRelation *)comments
{
    [self addRelation:comments ForKey:ra_life_commentsKey];
}

-(void)addComment:(RALifeComment *)comment
{
    self.commentCount++;
    if (!self.comments) {
        BmobRelation *comments = [BmobRelation relation];
        [comments addObject:comment.bObj];
        [self setComments:comments];
    }
    else
    {
        [self.comments addObject:comment.bObj];
    }
    [self updateInBackground];
}

//获得暂列表
-(void)getAdmireArray:(FinishArrayHandler)handler
{
    
}

@end
