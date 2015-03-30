//
//  RAAdmire.h
//  RockArea
//
//  Created by YongCheHui on 15/3/30.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RABaseDataObject.h"
#import "BmobUser+RAUser.h"
#import "RALifeModel.h"

@interface RAAdmire : RABaseDataObject
@property(nonatomic) RAUser* user;
@property(nonatomic) RALifeModel* life;
+(id)newLifeAdmire;
@end
