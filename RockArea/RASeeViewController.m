//
//  RASeeViewController.m
//  RockArea
//
//  Created by YongCheHui on 15/3/25.
//  Copyright (c) 2015年 YongCheHui. All rights reserved.
//

#import "RASeeViewController.h"
#import "RAUserManager.h"
#import "RALifeManager.h"
#import "RA_XWDManager.h"
#import "RA_XWDMapView.h"

@interface RASeeViewController ()

@end

@implementation RASeeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        UIViewController *loginNavi = [sb instantiateViewControllerWithIdentifier:@"LoginNavi"];
//        [self presentVC:loginNavi];
//    });
    [RA_XWDManager getInstance];
    RA_XWDMapView *map = [[RA_XWDMapView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-108)];
    [RA_XWDManager addCells:map];
    [self.view addSubview:map];
}

- (IBAction)sendContent:(id)sender {
    //发生活
//    [RALifeManager sendTextLifeWithText:@"呵呵" finishHandler:^(BOOL isSuccess, NSError *error) {
//        NSLog(@"%d",isSuccess);
//    }];

    //赞／取消赞
//    BmobQuery *bq = [BmobQuery queryWithClassName:raLifeModelName];
    
    
//    [bq getObjectInBackgroundWithId:@"XG3sYYYZ" block:^(BmobObject *object, NSError *error) {
//        RALifeModel *life = [RALifeModel objectWithBombObj:object];
//        [life detectIsAdmire:^{
//            [RALifeManager admireActionTheLife:life];
//        }];
//    }];
    
//    //发评论
//    [RALifeManager commentTheLife:[RALifeModel objectWithObjectId:@"XG3sYYYZ"] text:@"嘻嘻"];
    
    //删除评论
    
   
}
@end
