//
//  RALoginViewController.h
//  RockArea
//
//  Created by YongCheHui on 15/3/26.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RALoginViewController : UIViewController
//用户名
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
//密码
@property (weak, nonatomic) IBOutlet UITextField *pwdTF;

//取消
-(IBAction)cancel:(id)sender;

//确认
-(IBAction)confirm:(id)sender;
@end
