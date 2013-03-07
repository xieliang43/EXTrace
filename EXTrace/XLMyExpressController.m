//
//  XLMyExpressController.m
//  EXTrace
//
//  Created by xie liang on 3/6/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLMyExpressController.h"

@interface XLMyExpressController ()

@end

@implementation XLMyExpressController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"我的快递";
        
        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addMyExpress:)];
        self.navigationItem.rightBarButtonItem = rightItem;
        
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editMyExpress:)];
        self.navigationItem.leftBarButtonItem = leftItem;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    YouMiView *adView = [[YouMiView alloc] initWithContentSizeIdentifier:YouMiBannerContentSizeIdentifier320x50 delegate:self];
    adView.appID = YOUMI_KEY;
    adView.appSecret = YOUMI_SECRET;
    adView.testing = YES;
    adView.appVersion = @"1.4";
    [adView start];
    [self.view addSubview:adView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addMyExpress:(id)sender
{
    XLAddExpressController *addExpress = [[XLAddExpressController alloc] initWithNibName:@"XLAddExpressController" bundle:nil];
    [self.navigationController pushViewController:addExpress animated:YES];
}

- (void)editMyExpress:(id)sender
{
    
}

#pragma mark - YouMiDelegate
- (void)didReceiveAd:(YouMiView *)adView
{
    Debug(@"success");
}

- (void)didFailToReceiveAd:(YouMiView *)adView  error:(NSError *)error
{
    Debug(@"fail");
}

@end
