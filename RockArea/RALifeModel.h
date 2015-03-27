//
//  RALifeModel.h
//  RockArea
//
//  Created by YongCheHui on 15/3/27.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import "RABaseDataObject.h"
/**
 *  内容类型
 */
typedef NS_ENUM(int, RALifeContentType){
    /**
     *  文本
     */
    RALifeContentTypeText,
    /**
     *  图片
     */
    RALifeContentTypeImage,
    /**
     *  文本和图片
     */
    RALifeContentTypeImageAndText,
    /**
     *  声音
     */
    RALifeContentTypeAudio,
    /**
     *  链接
     */
    RALifeContentTypeURL
};

@interface RALifeModel : RABaseDataObject
@property(nonatomic) NSString *text;
@property(nonatomic) BmobRelation *sendUser;
@property(nonatomic) NSArray *images;
@property(nonatomic) NSArray *imageSizes;
@property(nonatomic) int admireCount;
@property(nonatomic) int commentCount;
@property(nonatomic) BmobRelation *admires;
@property(nonatomic) BmobRelation *comments;
@property(nonatomic) RALifeContentType contentType;
@property(nonatomic) BmobFile *audio;
@property(nonatomic) int audioLength;
@end
