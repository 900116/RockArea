//
//  RA_XWDManager.m
//  RockArea
//
//  Created by YongCheHui on 15/4/2.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import "RA_XWDManager.h"
#import "RA_XWDCellView.h"
#import "RA_XWDMapView.h"
@interface RA_XWDManager()<RA_XWDCellViewDelegate,RA_XWDMapViewDelegate>
{
    //int _map[5][5];
    int p1;
    int p2;
    RA_XWDMapView *_mapView;
    RA_XWDCellView *_selectView;
}
@end

@implementation RA_XWDManager
+(instancetype)getInstance
{
    static dispatch_once_t onceToken;
    static RA_XWDManager *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}

-(id)init
{
    self = [super init];
    if (self) {
        p1 = 5;
        p2 = 5;
        [self mapInit];
    }
    return self;
}

static int _map[5][5] = {{1,1,1,1,1},{0,0,0,0,0},{0,0,0,0,0},{0,0,0,0,0},{-1,-1,-1,-1,-1}};;

-(void)mapInit
{
    //_map[5][5] = {{1,1,1,1,1},{0,0,0,0,0},{0,0,0,0,0},{0,0,0,0,0},{-1,-1,-1,-1,-1}};
//    for (int i = 0; i < 25; i++) {
//        _map[i/5][i%5] = map[i/5][i%5];
//    }
}

-(int)rightValue:(XWDPoint)point
{
    return _map[point.x+1][point.y];
}

-(int)rightValue:(XWDPoint)point step:(int)step
{
    return _map[point.x+step][point.y];
}

-(int)value:(XWDPoint)point
{
    return _map[point.x][point.y];
}

-(int)leftValue:(XWDPoint)point
{
    return _map[point.x-1][point.y];
}

-(int)leftValue:(XWDPoint)point step:(int)step
{
    return _map[point.x-step][point.y];
}

-(int)topValue:(XWDPoint)point
{
    return _map[point.x][point.y-1];
}

-(int)topValue:(XWDPoint)point step:(int)step
{
    return _map[point.x][point.y-step];
}

-(int)bottomValue:(XWDPoint)point
{
    return _map[point.x][point.y+1];
}

-(int)bottomValue:(XWDPoint)point step:(int)step
{
    return _map[point.x][point.y+step];
}

-(void)orignPointToLeft
{
    XWDPoint oP = _selectView.point;
    if (oP.x == 4) {
        return;
    }
    _map[oP.x][oP.y-1] = _selectView.value;
    _map[oP.x][oP.y] = 0;
    oP.y -= 1;
    _selectView.point = oP;
    CGPoint point = [self pointWithXWDPoint:oP];
    _selectView.center = point;
    [self detectShot:oP];
}

-(void)orignPointToRight
{
    XWDPoint oP = _selectView.point;
    if (oP.y == 4) {
        return;
    }
    _map[oP.x][oP.y+1] = _selectView.value;
    _map[oP.x][oP.y] = 0;
    oP.y += 1;
    _selectView.point = oP;
    CGPoint point = [self pointWithXWDPoint:oP];
    _selectView.center = point;
    [self detectShot:oP];
}

-(void)orignPointToTop
{
    XWDPoint oP = _selectView.point;
    if (oP.x == 0) {
        return;
    }
    _map[oP.x-1][oP.y] = _selectView.value;
    _map[oP.x][oP.y] = 0;
    oP.x -= 1;
    _selectView.point = oP;
    CGPoint point = [self pointWithXWDPoint:oP];
    _selectView.center = point;
    [self detectShot:oP];
}

-(void)orignPointToBottom
{
    XWDPoint oP = _selectView.point;
    if (oP.x == 4) {
        return;
    }
    _map[oP.x+1][oP.y] = _selectView.value;
    _map[oP.x][oP.y] = 0;
    oP.x += 1;
    _selectView.point = oP;
    CGPoint point = [self pointWithXWDPoint:oP];
    _selectView.center = point;
    [self detectShot:oP];
}

/**
 *  检测是否有枪
 *
 *  @param point 坐标
 *  @return 是否有枪
 */
-(void)detectShot:(XWDPoint)point
{
    BOOL hasShot = [self horHasShot] || [self verHasShot];
    if (hasShot) {
        NSLog(@"有枪，可以吃字儿");
    }
//    BOOL hasShot = [self leftHasShot:point] || [self rightHasShot:point] || [self topHasShot:point] || [self bottomHasShot:point];
//    if (hasShot) {
//        NSLog(@"有枪");
//        int fail;
//        if (value == 1) {
//            fail = p2;
//        }
//        else
//        {
//            fail = p1;
//        }
//        fail--;
//        if (fail == 1) {
//            NSLog(@"value%d获胜",-value);
//        }
//        else
//        {
//            NSLog(@"中枪，吃掉对方的子儿");
//        }
//    }
    [self selectedCellView:nil];
}

//检测水平方向是否有枪
-(BOOL)horHasShot
{
    int row = _selectView.point.x;
    int col = _selectView.point.y;
    int begin = col-1;
    int end = col+1;
    if (col == 5) {
        begin = col- 2;
        end = 5;
    }
    if (col == 0) {
        begin = 0;
        end = 2;
    }
    int count = 0;
    for (int i = begin; i <= end; i++) {
        XWDPoint xP;
        xP.x = row;
        xP.y = i;
        int value = [self value:xP];
        if (value == 0) {
            return NO;
        }
        else
        {
            count += value;
        }
    }
    if (count == _selectView.value) {
        return YES;
    }
    return NO;
}

//检测竖直方向是否有枪
-(BOOL)verHasShot
{
    int row = _selectView.point.y;
    int col = _selectView.point.x;
    int begin = row-1;
    int end = row+1;
    if (row == 4) {
        begin = col- 2;
        end = 4;
    }
    else if (row == 0) {
        begin = 0;
        end = 2;
    }
    else if (row == 1) {
        begin = 0;
        end = 3;
    }
    else if(row == 2)
    {
        begin = 0;
        end = 4;
    }
    else if(row == 3)
    {
        begin = 1;
        end = 4;
    }
    int count = 0;
    for (int i = begin; i <= end; i++) {
        XWDPoint xP;
        xP.x = col;
        xP.y = i;
        int value = [self value:xP];
        if (value == 0)
        {
            if (i < row) {
                count = 0;
                continue;
            }
            else
            {
                break;
            }
        }
        else
        {
            count += value;
        }
    }
    if (count == _selectView.value) {
        return YES;
    }
    return NO;
}

-(CGPoint)pointWithXWDPoint:(XWDPoint)point
{
    CGFloat Wsetp = (_mapView.frame.size.width - 60)/4;
    CGFloat Hstep = (_mapView.frame.size.height - 60)/4;
    CGFloat beginX = 30;
    CGFloat beginY = 30;
    return CGPointMake(beginX+point.y*Wsetp,beginY + point.x *Hstep);
}

-(XWDPoint)xwdPointWithPoint:(CGPoint)point
{
    CGFloat Wsetp = (_mapView.frame.size.width - 60.f)/4;
    CGFloat Hstep = (_mapView.frame.size.height - 60.f)/4;
    CGFloat beginX = 30.f;
    CGFloat beginY = 30.f;
    XWDPoint xPoint;
    CGFloat gFX = (point.x - beginX)/Wsetp;
    CGFloat gFY = (point.y - beginY)/Hstep;
    xPoint.y = round(gFX);
    xPoint.x = round(gFY);
    return xPoint;
}

+(void)addCells:(UIView *)mapView
{
    [[RA_XWDManager getInstance] addCells:mapView];
}

-(void)addCells:(UIView *)mapView
{
    _mapView = (RA_XWDMapView *)mapView;
    _mapView.delegate = self;
    for (int i = 0; i < 5; ++i) {
        XWDPoint p;
        p.x = 0;
        p.y = i;
        CGPoint point = [self pointWithXWDPoint:p];
        RA_XWDCellView *cell = [[RA_XWDCellView alloc]initWithFrame:CGRectMake(0,0, 40, 40)];
        cell.point = p;
        cell.value = 1;
        cell.delegate = self;
        cell.center = point;
        cell.bgColor = [UIColor redColor];
        [mapView addSubview:cell];
    }
    for (int i = 0; i < 5; ++i) {
        XWDPoint p;
        p.x = 4;
        p.y = i;
        CGPoint point = [self pointWithXWDPoint:p];
        RA_XWDCellView *cell = [[RA_XWDCellView alloc]initWithFrame:CGRectMake(0,0, 40, 40)];
        cell.point = p;
        cell.value = -1;
        cell.center = point;
        cell.delegate = self;
        cell.bgColor = [UIColor greenColor];
        [mapView addSubview:cell];
    }
}

-(void)selectedCellView:(RA_XWDCellView *)view
{
    if (_selectView != view) {
        _selectView.selected = NO;
        _selectView = view;
        _selectView.selected = YES;
    }
    else
    {
        _selectView.selected = !_selectView.selected;
    }
}

-(int)abs:(int)value
{
    if (value >= 0) {
        return value;
    }
    else return -value;
}

-(void)touchMapPoint:(CGPoint)point
{
    if (!_selectView) {
        NSLog(@"没有选棋子");
        return;
    }
    XWDPoint wPoint = [self xwdPointWithPoint:point];
    if (wPoint.x < 0 || wPoint.x > 4 || wPoint.y < 0 || wPoint.y > 4 ) {
        NSLog(@"目标不可达");
        return;
    }
    if (wPoint.x == _selectView.point.x) {
        if ([self abs:wPoint.y - _selectView.point.y] == 1) {
            if (wPoint.y < _selectView.point.y) {
                //往左走
                [self orignPointToLeft];
            }
            else if(wPoint.y > _selectView.point.y)
            {
                [self orignPointToRight];
            }
            else
            {
                [self selectedCellView:nil];
            }
        }
        else
        {
            NSLog(@"目标不可达");
        }
        return;
    }
    if (wPoint.y == _selectView.point.y) {
        if ([self abs:wPoint.x - _selectView.point.x] == 1) {
            if (wPoint.x < _selectView.point.x) {
                //往左走
                [self orignPointToTop];
            }
            else if(wPoint.x > _selectView.point.x)
            {
                [self orignPointToBottom];
            }
            else
            {
                [self selectedCellView:_selectView];
            }
        }
        else
        {
            NSLog(@"目标不可达");
        }
        return;
    }
}
@end
