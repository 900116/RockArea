//
//  RAUploadImageHelper.m
//  RockArea
//
//  Created by YongCheHui on 15/3/30.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import "RAUploadImageHelper.h"
#import <CommonCrypto/CommonDigest.h>

@implementation RAUploadImageHelper
+(NSString*)md5WithData:(NSData *)data
{
    unsigned char result[16];
    CC_MD5( data.bytes, (uint)data.length, result ); // This is the md5 call
    return [NSString stringWithFormat:
            @"%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

#pragma TODO 压缩
+(void)uploadImages:(NSArray *)images handler:(FinishUploadImageHandler)handler
{
    NSMutableArray* paths = [NSMutableArray new];
    NSMutableArray* sizes = [NSMutableArray new];
    for (ALAsset *asset in images) {
        NSURL *url = asset.defaultRepresentation.url;
        NSString *path = [url path];
        [paths addObject:path];
        UIImage * image = [UIImage imageWithContentsOfFile:path];
        [sizes addObject:NSStringFromCGSize(image.size)];
    }
    [BmobFile filesUploadBatchWithPaths:paths progressBlock:^(int index, float progress) {
        
    } resultBlock:^(NSArray *array, BOOL isSuccessful, NSError *error) {
        if (isSuccessful) {
            NSMutableArray *urls = [NSMutableArray new];
            for (BmobFile *file in array) {
                [urls addObject:file.url];
            }
            handler(urls,sizes,nil);
        }
        else
        {
            handler(nil,nil,error);
        }
    }];
}
@end
