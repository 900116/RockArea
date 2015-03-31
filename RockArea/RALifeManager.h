//
//  RALifeManager.h
//  RockArea
//
//  Created by YongCheHui on 15/3/30.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RALifeModel.h"
#import "RALifeComment.h"

/**
 *  生活管理
 */
@interface RALifeManager : NSObject
/**
 *  获得生活列表
 *
 *  @param page     页数 从0开始
 *  @param pageSize 每页个数
 *  @param handler  返回结果
 */
+(void)getLifesWithPage:(int)page intPageSize:(int)pageSize finishHandler:(FinishArrayHandler)handler;

/**
 *  发送生活
 *
 *  @param text    文本
 *  @param handler 返回结果
 */
+(void)sendTextLifeWithText:(NSString *)text finishHandler:(FinishBoolHandler)handler;

/**
 *  发图片生活
 *
 *  @param images  图片
 *  @param handler 返回结果
 */
+(void)sendImageLifeWithImages:(NSArray *)images finishHandler:(FinishBoolHandler)handler;

/**
 *  发图文生活
 *
 *  @param images  图片
 *  @param text    文本
 *  @param handler 返回结果
 */
+(void)sendImageLifeWithImages:(NSArray *)images text:(NSString *)text finishHandler:(FinishBoolHandler)handler;

/**
 *  删除生活
 *
 *  @param life 生活
 */
+(void)deleteTheLife:(RALifeModel *)life;

/**
 *
 *
 *  @param model 生活对象
 */
+(void)admireActionTheLife:(RALifeModel *)model;

/**
 *  评论
 *
 *  @param model 生活model
 */
+(void)commentTheLife:(RALifeModel *)model text:(NSString *)comment;

/**
 *  删除评论
 *
 *  @param comment 评论
 */
+(void)deleteComment:(RALifeComment *)comment;
@end
