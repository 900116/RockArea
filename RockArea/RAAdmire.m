//
//  RAAdmire.m
//  RockArea
//
//  Created by YongCheHui on 15/3/30.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import "RAAdmire.h"
static NSString* const ra_admire_userKey = @"user";
static NSString* const ra_admire_lifeKey = @"life";

@implementation RAAdmire
+(id)newLifeAdmire
{
    RAAdmire *admire = [super newObject];
    [admire setClassName:raLifeAdmireModelName];
    [admire setUser:[RAUser getCurrentUser]];
    return admire;
}

-(void)setUser:(RAUser *)user
{
    BmobRelation* currUser = [BmobRelation relation];
    [currUser addObject:user];
    [self addRelation:currUser ForKey:ra_admire_userKey];
}

-(RAUser *)user
{
    BmobRelation* currUser = [self objectForKey:ra_admire_userKey];
    return currUser;
}

-(void)setLife:(RALifeModel *)life
{
    BmobRelation* lifeR = [BmobRelation relation];
    [lifeR addObject:life];
    
}
@end
