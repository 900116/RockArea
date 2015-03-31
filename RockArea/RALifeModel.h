//
//  RALifeModel.h
//  RockArea
//
//  Created by YongCheHui on 15/3/27.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import "RABaseDataObject.h"
#import "RALifeComment.h"
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
@property(nonatomic) NSArray *images;
@property(nonatomic) NSArray *imageSizes;
@property(nonatomic) int admireCount;
@property(nonatomic) int commentCount;
@property(nonatomic) RALifeContentType contentType;
@property(nonatomic) BmobFile *audio;
@property(nonatomic) int audioLength;
@property(nonatomic) BOOL isAdimre;
@property(nonatomic) NSString *usrID;
-(void)findSendUser;
-(RAUser *)sendUser;
-(void)detectIsAdmire:(FinishVoidHandler)handler;
-(void)admireAction;
-(void)unAdmireAction;
-(void)addComment:(RALifeComment*)comment;
+(BmobQuery *)lifeQuery;
-(void)getAdmireArray:(FinishArrayHandler)handler;
@end
