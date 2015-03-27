//
//  BmobObject+BaseType.m
//  RockArea
//
//  Created by YongCheHui on 15/3/26.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import "BmobObject+BaseType.h"

@implementation BmobObject (BaseType)
-(void)setInt:(int)intValue forKey:(NSString *)key
{
    [self setObject:[NSNumber numberWithInt:intValue] forKey:key];
}

-(int)intforKey:(NSString *)key
{
    return [[self objectForKey:key] intValue];
}

-(void)setBool:(BOOL)boolValue forKey:(NSString *)key
{
    [self setObject:[NSNumber numberWithBool:boolValue] forKey:key];
}

-(BOOL)boolForKey:(NSString *)key
{
    return [[self objectForKey:key] boolValue];
}

-(void)setDouble:(double)doubleValue forKey:(NSString *)key
{
    [self setObject:[NSNumber numberWithDouble:doubleValue] forKey:key];
}

-(BOOL)doubleForKey:(NSString *)key
{
    return [[self objectForKey:key] doubleValue];
}
@end


