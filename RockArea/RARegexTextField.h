//
//  RARegexTextField.h
//  RockArea
//
//  Created by YongCheHui on 15/3/26.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ReturnKeyAction)();

/**
 *  正则表达式TextField
 */
@interface RARegexTextField : UITextField
/**
 *  正则表达式
 */
@property(nonatomic,copy) NSString *regex;
@property(nonatomic,weak) UITextField *nextTF;
@property(nonatomic,copy) ReturnKeyAction returnKeyAction;
-(BOOL)isValid;
@end
