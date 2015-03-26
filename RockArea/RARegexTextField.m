//
//  RARegexTextField.m
//  RockArea
//
//  Created by YongCheHui on 15/3/26.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import "RARegexTextField.h"

@implementation RARegexTextField
-(instancetype)init
{
    self = [super init];
    if (self) {
        [self customInit];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self customInit];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self customInit];
    }
    return self;
}

-(void)customInit
{
    [RANotificationCenter addObserver:self selector:@selector(endEditingAction:) name:UITextFieldTextDidEndEditingNotification object:nil];
}

-(void)endEditingAction:(UITextField *)textField
{
    if (textField == self) {
        if (!self.allowNullContent) {
            if (!textField || [textField.text isEqualToString:@""]) {
                NSLog(@"不允许为空");
            }
        }
        if (self.regex) {
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",self.regex];
            BOOL isValid = [predicate evaluateWithObject:textField.text];
            if (!isValid) {
                NSLog(@"%@",self.regexCheckMessage);
            }
        }
    }
}
@end
