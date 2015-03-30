//
//  RAUploadImageHelper.h
//  RockArea
//
//  Created by YongCheHui on 15/3/30.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface RAUploadImageHelper : NSObject
/**
 *  上传图片
 *
 *  @param image   图片
 *  @param handler 返回结果
 */

+(void)uploadImages:(NSArray *)images handler:(FinishUploadImageHandler)handler;
@end
