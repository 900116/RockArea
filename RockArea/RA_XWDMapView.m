//
//  RA_XWDMapView.m
//  RockArea
//
//  Created by YongCheHui on 15/4/2.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import "RA_XWDMapView.h"

@implementation RA_XWDMapView
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    int step = (rect.size.height - 60)/4;
    for (int i = 0; i < 5; i++) {
        int x = 30;
        int y = 30 + i * step;
        CGContextSetLineWidth(context, 1.5);
        CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
        CGContextMoveToPoint(context, x, y);
        CGContextAddLineToPoint(context, rect.size.width-30, y+1);
        CGContextStrokePath(context);
    }
    step = (rect.size.width - 60)/4;
    for (int i = 0; i < 5; i++) {
        int x = 30 + step * i;
        int y = 30;
        CGContextSetLineWidth(context, 1.5);
        CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
        CGContextMoveToPoint(context, x, y);
        CGContextAddLineToPoint(context, x+1, rect.size.height - 30);
        CGContextStrokePath(context);
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if ([touch.view isKindOfClass:[self class]]) {
        CGPoint point =  [touch locationInView:touch.view];
        [self.delegate touchMapPoint:point];
    }
}
@end
