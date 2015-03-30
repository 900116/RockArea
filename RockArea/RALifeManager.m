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
    BmobQuery *bquery = [BmobQuery queryWithClassName:raLifeModelName];
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

+(BmobRelation *)sendUser
{
    __autoreleasing BmobRelation *currUser  = [BmobRelation relation];
    RAUser *user = [RAUser getCurrentUser];
    [currUser addObject:user];
    return currUser;
}

#pragma mark 发生活
+(void)sendTextLifeWithText:(NSString *)text finishHandler:(FinishBoolHandler)handler
{
    RALifeModel *life = [RALifeModel newLife];
    life.text = text;
    life.sendUser = [self sendUser];
    life.contentType = RALifeContentTypeText;
    [life saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
        handler(isSuccessful,error);
    }];
}

+(void)sendImageLifeWithImages:(NSArray *)images finishHandler:(FinishBoolHandler)handler
{
    [RAUploadImageHelper uploadImages:images handler:^(NSArray *urls, NSArray *sizes, NSError *error) {
        if (!error) {
            RALifeModel *life = [RALifeModel newLife];
            life.images = urls;
            life.imageSizes = sizes;
            life.sendUser = [self sendUser];
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
            RALifeModel *life = [RALifeModel newLife];
            life.images = urls;
            life.imageSizes = sizes;
            life.sendUser = [self sendUser];
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

#pragma mark - 赞
+(void)admireTheLife:(RALifeModel *)model
{
    if (model.isAdimre) {
        model.admireCount --;
        [model.admires removeObject:[RAUser getCurrentUser]];
    }
    else
    {
        model.admireCount ++;
        if (!model.admires) {
            BmobRelation *relation = [BmobRelation relation];
            [relation addObject:[RAUser getCurrentUser]];
            model.admires = relation;
        }
        else
        {
            [model.admires addObject:[RAUser getCurrentUser]];
        }
    }
}
@end