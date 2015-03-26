//
//  RABaseDataObject.h
//  RockArea
//
//  Created by YongCheHui on 15/3/25.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BmobObject+BaseType.h"
/**
 *  这是一个抽象类，只能继承
 */
@interface RABaseDataObject : NSObject
/**
 *  必须被重写
 *
 *  @return 模版名字
 */
-(NSString *)modelName;
+(id)newObject;
-(void)saveInBackgroundWithResultBlock:(BmobBooleanResultBlock)block;
+(instancetype)objectWithBombObj:(BmobObject *)bObj;

-(id)objectForKey:(NSString *)key;
-(void)setObject:(id)obj forKey:(NSString *)key;

-(BOOL)boolForKey:(NSString *)key;
-(void)setBool:(BOOL)boolValue forKey:(NSString *)key;

-(int)intForKey:(NSString *)key;
-(void)setInt:(int)intValue forKey:(NSString *)key;
@end