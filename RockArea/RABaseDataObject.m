//
//  RABaseDataObject.m
//  RockArea
//
//  Created by YongCheHui on 15/3/25.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import "RABaseDataObject.h"

@interface RABaseDataObject ()
{
    __strong BmobObject *_obj;
}
@end

@implementation RABaseDataObject
+(id)newObject
{
    __autoreleasing RABaseDataObject *obj = [[self alloc]init];
    return obj;
}

-(void)setClassName:(NSString *)className
{
    _obj = [BmobObject objectWithClassName:className];
}

-(NSString *)className
{
    return _obj.className;
}

-(void)saveInBackgroundWithResultBlock:(BmobBooleanResultBlock)block
{
    [_obj saveInBackgroundWithResultBlock:block];
}

-(void)saveInBackground
{
    [_obj saveInBackground];
}

+(instancetype)objectWithBombObj:(BmobObject *)bObj
{
    __autoreleasing RABaseDataObject *obj = [[self alloc]init];
    obj->_obj = bObj;
    return obj;
}

-(void)setObject:(id)obj forKey:(NSString *)key
{
    [_obj setObject:obj forKey:key];
}

-(id)objectForKey:(NSString *)key
{
    return [_obj objectForKey:key];
}

-(void)setBool:(BOOL)boolValue forKey:(NSString *)key
{
    [_obj setBool:boolValue forKey:key];
}

-(BOOL)boolForKey:(NSString *)key
{
    return [_obj boolForKey:key];
}

-(int)intForKey:(NSString *)key
{
    return [_obj intforKey:key];
}

-(void)setInt:(int)intValue forKey:(NSString *)key
{
    [_obj setInt:intValue forKey:key];
}

#pragma mark BmobObject
-(void)setObjectId:(NSString *)objectId
{
    _obj.objectId = objectId;
}

-(NSString *)objectId
{
    return _obj.objectId;
}

-(void)setUpdatedAt:(NSDate *)updatedAt
{
    _obj.updatedAt = updatedAt;
}

-(NSDate *)updatedAt
{
    return _obj.updatedAt;
}

-(void)setCreatedAt:(NSDate *)createdAt
{
    _obj.createdAt = createdAt;
}

-(NSDate *)createdAt
{
    return _obj.createdAt;
}

-(void)addRelation:(BmobRelation *)relation ForKey:(NSString *)key
{
    [_obj addRelation:relation forKey:key];
}
@end
