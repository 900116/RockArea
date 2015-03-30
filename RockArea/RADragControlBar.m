//
//  RADragControlBar.m
//  RockArea
//
//  Created by YongCheHui on 15/3/30.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import "RADragControlBar.h"

@implementation RADragControlBar
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self customInit];
    }
    return self;
}

-(id)init
{
    return [self initWithFrame:CGRectZero];
}

-(void)customInit
{
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
