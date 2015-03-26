//
//  RASeeViewController.m
//  RockArea
//
//  Created by YongCheHui on 15/3/25.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import "RASeeViewController.h"
#import "RAUserManager.h"

@interface RASeeViewController ()

@end

@implementation RASeeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [RAUserManager registerUserWithMail:@"838053527@qq.com" pwd:@"123456" repHandler:^(BmobUser *user, NSError *error) {
        if (user) {
            
        }
        else
        {
            
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
