//
//  RADragControlBar.h
//  RockArea
//
//  Created by YongCheHui on 15/3/30.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RADragControlBar : UIView
@property(nonatomic,strong) UIColor *borderColor;
@property(nonatomic,strong) UIColor *topColor;
@property(nonatomic,strong) UIColor *rightColor;
@property(nonatomic,strong) UIColor *leftColor;

@property(nonatomic) int currIdx;
@property(nonatomic) BOOL rotate;
@property(nonatomic) UIColor *selectColor;
@end
