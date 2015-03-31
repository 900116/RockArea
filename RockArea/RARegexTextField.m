//
//  RARegexTextField.m
//  RockArea
//
//  Created by YongCheHui on 15/3/26.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import "RARegexTextField.h"
@interface RARegexTextField()<UITextFieldDelegate>
@end

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
    self.delegate = self;
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = [UIColor blackColor].CGColor;
    [RANotificationCenter() addObserver:self selector:@selector(textChangeAction:) name:UITextFieldTextDidChangeNotification object:nil];
}


-(BOOL)isValid
{
    if (!self.regex) {
        return YES;
    }
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",self.regex];
    return [predicate evaluateWithObject:self.text];
}

-(void)textChangeAction:(NSNotification *)nf
{
    id obj = nf.object;
    if (self == obj) {
        if (![self isValid]) {
            [self.layer setBorderColor:[UIColor redColor].CGColor];
        }
        else
        {
            [self.layer setBorderColor:[UIColor blackColor].CGColor];
        }
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (![self isValid]) {
        __weak typeof(self) weakSelf = self;
        [UIView animateWithDuration:0.8 animations:^{
            [weakSelf.layer setBorderColor:[UIColor blackColor].CGColor];
        } completion:^(BOOL finished) {
            [weakSelf.layer setBorderColor:[UIColor redColor].CGColor];
        }];
        return YES;
    }
    if (self.returnKeyType == UIReturnKeyNext) {
        [self.nextTF becomeFirstResponder];
        [textField resignFirstResponder];
    }
    else
    {
        if (self.returnKeyAction) {
            self.returnKeyAction();
        }
    }
    return YES;
}

-(void)removeFromSuperview
{
    [RANotificationCenter() removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
    [self.layer setBorderColor:[UIColor redColor].CGColor];
    [super removeFromSuperview];
}
@end
