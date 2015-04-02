//
//  RA_XWDManager.h
//  RockArea
//
//  Created by YongCheHui on 15/4/2.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef struct
{
    int x;
    int y;
}XWDPoint;


/**
 *  下五道游戏管理类
 */
@interface RA_XWDManager : NSObject
+(instancetype)getInstance;
+(void)addCells:(UIView *)mapView;
@end
