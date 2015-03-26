//
//  UIViewController+Extense.h
//  RockArea
//
//  Created by YongCheHui on 15/3/26.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Extense)
-(void)dismiss;
-(void)presentVC:(UIViewController *)vc;

-(void)pushVC:(UIViewController *)vc;
-(void)pop;
@end
