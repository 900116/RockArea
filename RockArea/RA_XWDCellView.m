//
//  RA_XWDCellView.m
//  RockArea
//
//  Created by YongCheHui on 15/4/2.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import "RA_XWDCellView.h"
@interface RA_XWDCellView()
{
    UIColor *selectedColor;
}
@end

@implementation RA_XWDCellView
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        selectedColor = [UIColor grayColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor *color = self.bgColor;
    if (_selected) {
        color = selectedColor;
    }
    CGContextSetStrokeColorWithColor(context, [color CGColor]);
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillEllipseInRect(context, CGRectMake(rect.origin.x, rect.origin.y,40.0, 40.0));
    CGContextSetLineWidth(context, 1.5);
    CGContextStrokePath(context);
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.delegate selectedCellView:self];
}

-(void)setSelected:(BOOL)selected
{
    _selected  = selected;
    [self setNeedsDisplay];
}
@end
