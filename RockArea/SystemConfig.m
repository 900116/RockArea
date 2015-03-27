//
//  SystemConfig.m
//  RockArea
//
//  Created by YongCheHui on 15/3/26.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import "SystemConfig.h"
static NSString* const ra_cmid_key = @"ID";
static NSString* const ra_cmname_key = @"name";
@implementation ConfigModel
- (void)encodeWithCoder:(NSCoder*)coder
{
    [coder encodeInt:_ID forKey:ra_cmid_key];
    [coder encodeObject:_name forKey:ra_cmname_key];
}

- (id)initWithCoder:(NSCoder*)decoder
{
    if (self = [super init])
    {
        if (decoder == nil)
        {
            return self;
        }
        _ID = [decoder decodeIntForKey:ra_cmid_key];
        _name = [decoder decodeObjectForKey:ra_cmname_key];
    }
    return self;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"{ID:%d,name:%@}",self.ID,self.name];
}

+(ConfigModel *)objectWithBmobObj:(BmobObject *)obj
{
    ConfigModel *result = [[ConfigModel alloc]init];
    result.ID = [obj intforKey:ra_cmid_key];
    result.name = [obj objectForKey:ra_cmname_key];
    return result;
}
@end

#pragma mark - key
static NSString* const ra_stylesKey = @"RAStylesKey";
static NSString* const ra_instrumentsKey = @"RAinstrmentsKey";

static NSString* const ra_versionKey = @"version";
static NSString* const ra_stylesUpdateKey = @"stylesUpdate";
static NSString* const ra_instrumentsUpdateKey = @"InstrumentsUpdate";

@implementation SystemConfig
@dynamic stylesUpdate;
@dynamic instrumentsUpdate;
@dynamic version;
@dynamic styles;

+(instancetype)getInstance
{
    static dispatch_once_t onceToken;
    static SystemConfig *instance = nil;
    dispatch_once(&onceToken, ^{
        BmobQuery *bquery = [BmobQuery queryWithClassName:raSytemConfigModelName];
        [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
            if (array.count > 0) {
                //初始化成功
                BmobObject *obj = array[0];
                instance =  [SystemConfig objectWithBombObj:obj];
                [instance detectUpdate];
                [instance styles];
            }
        }];
    });
    return instance;
}


-(void)detectUpdate
{
    NSNumber *styleUpdate = [RAUserDefaulter objectForKey:ra_stylesUpdateKey];
    NSNumber *instrumentsUpdate = [RAUserDefaulter objectForKey:ra_instrumentsUpdateKey];
    if (!styleUpdate) {
        [RAUserDefaulter setObject:[NSNumber numberWithInt:self.stylesUpdate] forKey:ra_stylesUpdateKey];
        [RAUserDefaulter setObject:[NSNumber numberWithInt:self.instrumentsUpdate] forKey:ra_instrumentsUpdateKey];
    }
    BOOL needStyleUpdate = styleUpdate.intValue < self.stylesUpdate;
    BOOL needInstrumentsUpdate = instrumentsUpdate.intValue < self.instrumentsUpdate;
    [self asynUpdateWithKey:ra_stylesKey needUpdate:needStyleUpdate modelName:raStylesModelName];
    [self asynUpdateWithKey:ra_instrumentsKey needUpdate:needInstrumentsUpdate modelName:raInstumentsModelName];
}

-(void)asynUpdateWithKey:(NSString *)key needUpdate:(BOOL)needUpdate modelName:(NSString *)modelName
{
    if ([modelName isEqualToString:raInstumentsModelName]) {
        [RAUserDefaulter setObject:[NSNumber numberWithInt:self.instrumentsUpdate] forKey:ra_instrumentsUpdateKey];
    }
    else if([modelName isEqualToString:raStylesModelName])
    {
        [RAUserDefaulter setObject:[NSNumber numberWithInt:self.stylesUpdate] forKey:ra_stylesUpdateKey];
    }
    NSArray *data = [RAUserDefaulter objectForKey:key];
    if (!data) {
        [self asynUpdateDataForKey:key modelName:modelName];
    }
    else
    {
        if (needUpdate) {
            [self asynUpdateDataForKey:key modelName:modelName];
        }
    }
}

-(void)asynUpdateDataForKey:(NSString *)key modelName:(NSString *)modelName
{
    NSLog(@"Update");
    //从比目云下载
    BmobQuery *subQuery = [BmobQuery queryWithClassName:modelName];
    subQuery.limit = 1000;
    [subQuery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        NSMutableArray *datas = [[NSMutableArray alloc]init];
        for (BmobObject* bObj in array) {
            ConfigModel* model = [ConfigModel objectWithBmobObj:bObj];
            [datas addObject:[NSKeyedArchiver archivedDataWithRootObject:model]];
        }
        if (datas.count > 0) {
            [RAUserDefaulter setObject:datas forKey:key];
            [RAUserDefaulter synchronize];
        }
        NSLog(@"%@",datas);
    }];
}

-(void)setVersion:(NSString *)version
{
    [self setObject:version forKey:ra_versionKey];
}

-(NSString *)version
{
    return [self objectForKey:ra_versionKey];
}

-(void)setStylesUpdate:(int)stylesUpdate
{
    [self setInt:stylesUpdate forKey:ra_stylesUpdateKey];
}

-(int)stylesUpdate
{
    return [self intForKey:ra_stylesUpdateKey];
}

-(void)setInstrumentsUpdate:(int)instrumentsUpdate
{
    [self setInt:instrumentsUpdate forKey:ra_instrumentsUpdateKey];
}

-(int)instrumentsUpdate
{
    return [self intForKey:ra_instrumentsUpdateKey];
}

-(NSArray *)archiveArrayFromUDWithKey:(NSString *)key
{
    NSMutableArray *result = [NSMutableArray new];
    NSArray *array = [RAUserDefaulter objectForKey:key];
    for (NSData *data in array) {
        [result addObject:[NSKeyedUnarchiver unarchiveObjectWithData:data]];
    }
    NSLog(@"%@",result);
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:ra_cmid_key ascending:YES];
    return [result sortedArrayUsingDescriptors:@[sort]];
}

-(NSArray *)styles
{
    return [self archiveArrayFromUDWithKey:ra_stylesKey];
}

-(NSArray *)instruments
{
    return [self archiveArrayFromUDWithKey:ra_instrumentsKey];
}

@end
