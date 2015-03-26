//
//  UIViewController+Extense.m
//  RockArea
//
//  Created by YongCheHui on 15/3/26.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import "UIViewController+Extense.h"

@implementation UIViewController (Extense)
-(void)dismiss
{
    if (RASelfNavi) {
        [RASelfNavi dismiss];
    }
    else
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

-(void)presentVC:(UIViewController *)vc
{
    if (RASelfNavi) {
        [RASelfNavi presentVC:vc];
    }
    else
    {
        [self presentViewController:vc animated:YES completion:nil];
    }
}

-(void)pushVC:(UIViewController *)vc
{
    if (!RASelfNavi) {
        NSAssert(YES, @"没有navi，无法push");
    }
    [RASelfNavi pushViewController:vc animated:YES];
}

-(void)pop
{
    if (!RASelfNavi) {
        NSAssert(YES, @"没有navi，无法pop");
    }
    [RASelfNavi popViewControllerAnimated:YES];
}
@end
