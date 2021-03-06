//
//  RALifeManager.m
//  RockArea
//
//  Created by YongCheHui on 15/3/30.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import "RALifeManager.h"
#import "RALifeModel.h"
#import "BmobUser+RAUser.h"
#import "RAUploadImageHelper.h"

@implementation RALifeManager
#pragma mark 获得生活列表
+(void)getLifesWithPage:(int)page intPageSize:(int)pageSize finishHandler:(FinishArrayHandler)handler
{
    BmobQuery *bquery = [RALifeModel lifeQuery];
    //分页
    bquery.limit = pageSize;
    bquery.skip = pageSize * page;
    //按时间倒叙
    [bquery orderByDescending:@"createdAt"];
    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        if (!error) {
            //获得生活成功
            NSMutableArray *results = [NSMutableArray new];
            for (BmobObject *obj in array) {
                RALifeModel *model = [RALifeModel objectWithBombObj:obj];
                [results addObject:model];
                
            }
            handler(results,nil);
        }
        else
        {
            handler(nil,error);
        }
    }];
}

/**
 *  检测是否被赞
 *
 *  @param life 生活
 */
+(void)detectLifeisAdmire:(RALifeModel *)life
{
    [life detectIsAdmire:nil];
}


#pragma mark 发生活
+(void)sendTextLifeWithText:(NSString *)text finishHandler:(FinishBoolHandler)handler
{
    RALifeModel *life = [RALifeModel newObject];
    life.text = text;
    life.contentType = RALifeContentTypeText;
    [life saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
        handler(isSuccessful,error);
    }];
}

+(void)sendImageLifeWithImages:(NSArray *)images finishHandler:(FinishBoolHandler)handler
{
    [RAUploadImageHelper uploadImages:images handler:^(NSArray *urls, NSArray *sizes, NSError *error) {
        if (!error) {
            RALifeModel *life = [RALifeModel newObject];
            life.images = urls;
            life.imageSizes = sizes;
            life.contentType = RALifeContentTypeImage;
            [life saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
                handler(isSuccessful,error);
            }];
        }
        else
        {
            handler(NO,error);
        }
    }];
    
}

+(void)sendImageLifeWithImages:(NSArray *)images text:(NSString *)text finishHandler:(FinishBoolHandler)handler
{
    [RAUploadImageHelper uploadImages:images handler:^(NSArray *urls, NSArray *sizes, NSError *error) {
        if (!error) {
            RALifeModel *life = [RALifeModel newObject];
            life.images = urls;
            life.imageSizes = sizes;
            life.contentType = RALifeContentTypeImageAndText;
            life.text = text;
            [life saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
                handler(isSuccessful,error);
            }];
        }
        else
        {
            handler(NO,error);
        }
    }];
}

#pragma mark - 删除生活
/**
 *  删除生活
 *
 *  @param life 生活
 */
+(void)deleteTheLife:(RALifeModel *)life
{
    [life deleteInBackground];
}

#pragma mark - 赞或取消赞
+(void)admireActionTheLife:(RALifeModel *)model
{
    if (model.isAdimre) {
        [model unAdmireAction];
    }
    else
    {
        [model admireAction];
    }
}

#pragma mark - 评论
+(void)commentTheLife:(RALifeModel *)model text:(NSString *)commentText
{
    RALifeComment *comment = [RALifeComment newObject];
    comment.text = commentText;
    comment.type = RACommentTypeComment;
    [comment saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
        if (isSuccessful) {
            [model addComment:comment];
            [model updateInBackground];
        }
    }];
}

#pragma mark - 删除评论
+(void)deleteComment:(RALifeComment *)comment
{
    [comment deleteInBackground];
}
@end