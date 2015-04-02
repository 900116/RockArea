//
//  RALoginViewController.m
//  RockArea
//
//  Created by YongCheHui on 15/3/26.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import "RALoginViewController.h"
#import "RAUserManager.h"
#import "RA_XWDMapView.h"

@interface RALoginViewController ()

@end

@implementation RALoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.nameTF.regex = @"^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$";
    self.nameTF.nextTF = self.pwdTF;
    
    self.pwdTF.regex = @"^[A-Za-z0-9]{6,20}$";
    __weak typeof(self) weakSelf = self;
    self.pwdTF.returnKeyAction = ^{
        NSLog(@"登陆过程");
        [weakSelf loginAction];
    };
}

-(IBAction)cancel:(id)sender
{
    [self dismiss];
}

-(IBAction)confirm:(id)sender
{
    [self loginAction];
}

-(void)loginAction
{
    if ([self.nameTF.text isEqualToString:@""]) {
        NSLog(@"邮箱不允许为空");
        return;
    }
    else if(!self.nameTF.isValid)
    {
        NSLog(@"邮箱的格式不对");
        return;
    }
    else if ([self.pwdTF.text isEqualToString:@""])
    {
        NSLog(@"密码不允许为空");
        return;
    }
    else if (!self.pwdTF.isValid)
    {
        NSLog(@"密码的格式不对");
        return;
    }
    [RAUserManager loginWithUserName:_nameTF.text pwd:_pwdTF.text repHandler:^(RAUser *user, RAError *error) {
        if (user) {
            [RANotificationCenter() postNotificationName:RALoginSuccessNotificationKey object:nil];
            [self dismiss];
        }
        else
        {
            NSLog(@"登陆失败");
        }
    }];
}
@end
