//
//  RA_XWDMapView.h
//  RockArea
//
//  Created by YongCheHui on 15/4/2.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol RA_XWDMapViewDelegate
-(void)touchMapPoint:(CGPoint)point;
@end

@interface RA_XWDMapView : UIView
@property(nonatomic) id<RA_XWDMapViewDelegate> delegate;
@end
