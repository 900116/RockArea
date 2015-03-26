//
//  RALoginViewController.m
//  RockArea
//
//  Created by YongCheHui on 15/3/26.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import "RALoginViewController.h"
#import "RAUserManager.h"

@interface RALoginViewController ()

@end

@implementation RALoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(IBAction)cancel:(id)sender
{
    [self dismiss];
}

-(IBAction)confirm:(id)sender
{
    [RAUserManager loginWithUserName:_nameTF.text pwd:_pwdTF.text repHandler:^(BmobUser *user, RAError *error) {
        if (user) {
            [RANotificationCenter postNotificationName:RALoginSuccessNotificationKey object:nil];
            [self dismiss];
        }
        else
        {
            NSLog(@"登陆失败");
        }
    }];
}
@end
