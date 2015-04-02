//
//  RA_XWDCellView.h
//  RockArea
//
//  Created by YongCheHui on 15/4/2.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RA_XWDManager.h"
@class RA_XWDCellView;
@protocol RA_XWDCellViewDelegate<NSObject>
-(void)selectedCellView:(RA_XWDCellView *)view;
@end

@interface RA_XWDCellView : UIView
@property(nonatomic,strong) UIColor *bgColor;
@property(nonatomic,assign) BOOL selected;
@property(nonatomic,assign) int value;
@property(nonatomic,assign) XWDPoint point;
@property(nonatomic,weak) id<RA_XWDCellViewDelegate> delegate;
@end
