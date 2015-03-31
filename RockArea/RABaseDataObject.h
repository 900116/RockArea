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
+(id)newObject;
-(void)saveInBackgroundWithResultBlock:(BmobBooleanResultBlock)block;
-(void)saveInBackground;
+(instancetype)objectWithBombObj:(BmobObject *)bObj;
-(void)updateInBackground;
-(void)deleteInBackground;

-(id)objectForKey:(NSString *)key;
-(void)setObject:(id)obj forKey:(NSString *)key;

-(BOOL)boolForKey:(NSString *)key;
-(void)setBool:(BOOL)boolValue forKey:(NSString *)key;

-(int)intForKey:(NSString *)key;
-(void)setInt:(int)intValue forKey:(NSString *)key;


-(void)addRelation:(BmobRelation *)relation ForKey:(NSString *)key;

@property(nonatomic)NSString *objectId;
@property(nonatomic)NSDate *updatedAt;
@property(nonatomic)NSDate *createdAt;

-(BmobObject *)bObj;
+(NSString *)className;
+(instancetype)objectWithObjectId:(NSString *)objectId;
@end
