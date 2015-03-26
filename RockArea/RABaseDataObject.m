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
-(NSString *)modelName
{
    NSAssert(YES, @"该方法必须被重载");
    return nil;
}

+(id)newObject
{
    RABaseDataObject *obj = [[self alloc]init];
    return obj;
}

-(id)init
{
    self = [super init];
    if (self) {
        _obj = [BmobObject objectWithClassName:[self modelName]];
    }
    return self;
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
    RABaseDataObject *obj = [[self alloc]init];
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
@end
