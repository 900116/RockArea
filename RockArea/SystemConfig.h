//
//  SystemConfig.h
//  RockArea
//
//  Created by YongCheHui on 15/3/26.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import "RABaseDataObject.h"

@interface ConfigModel : NSObject<NSCoding>
@property(nonatomic,assign) int ID;
@property(nonatomic,copy) NSString *name;
@end

@interface SystemConfig : RABaseDataObject
@property(nonatomic) NSString* version;
@property(nonatomic) int stylesUpdate;
@property(nonatomic) int instrumentsUpdate;
@property(nonatomic) NSArray *styles;
@property(nonatomic,readonly) NSArray *instruments;
/**
 *  单例
 *
 *  @return
 */
+(instancetype)getInstance;
@end
