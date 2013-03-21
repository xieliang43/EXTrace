//
//  XLAppsController.m
//  EXTrace
//
//  Created by xie liang on 3/21/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLAppsController.h"

@interface XLAppsController ()

@end

@implementation XLAppsController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    wall = [[YouMiWall alloc] initWithAppID:YOUMI_KEY withAppSecret:YOUMI_SECRET];
    wall.delegate = self;
    [wall requestOffers:NO];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - YouMiWallDelegate
- (void)didReceiveOffers:(YouMiWall *)adWall {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [wall showOffers:YouMiWallAnimationTransitionNone];
}

- (void)didFailToReceiveOffers:(YouMiWall *)adWall error:(NSError *)error {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                    message:[error localizedDescription]
                                                   delegate:nil
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
    [alert show];
}

@end
