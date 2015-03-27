//
//  BmobObject+BaseType.h
//  RockArea
//
//  Created by YongCheHui on 15/3/26.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import <BmobSDK/BmobObject.h>
@interface BmobObject (BaseType)
-(void)setInt:(int)intValue forKey:(NSString *)key;
-(int)intforKey:(NSString *)key;

-(void)setBool:(BOOL)boolValue forKey:(NSString *)key;
-(BOOL)boolForKey:(NSString *)key;

-(void)setDouble:(double)doubleValue forKey:(NSString *)key;
-(BOOL)doubleForKey:(NSString *)key;
@end
