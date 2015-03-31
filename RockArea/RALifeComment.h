//
//  RALifeComment.h
//  RockArea
//
//  Created by YongCheHui on 15/3/31.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import "RABaseDataObject.h"
/**
 *   评论类型
 */
typedef NS_ENUM(int,RACommentType){
    /**
     *  评论
     */
    RACommentTypeComment,
    /**
     *  回复
     */
    RACommentTypeReply,
    /**
     *  转发
     */
    RACommentTypeTransmit
};

@interface RALifeComment : RABaseDataObject
@property(nonatomic) NSString *text;
@property(nonatomic) RACommentType type;
@property(nonatomic) NSString *sendUserID;
@property(nonatomic) NSString *orignUserID;
@end
