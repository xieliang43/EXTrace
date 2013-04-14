//
//  XLShowExpressInfoController.m
//  EXTrace
//
//  Created by xie liang on 3/8/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLShowExpressInfoController.h"

@interface XLShowExpressInfoController ()

@end

@implementation XLShowExpressInfoController

@synthesize express = _express;
@synthesize tableView = _tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(backHome)];
        
        self.navigationItem.leftBarButtonItem = leftItem;
        
        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshInfo)];
        
        self.navigationItem.rightBarButtonItem = rightItem;
        
        _dao = [[XLSystemInfoDao alloc] init];
    }
    return self;
}

- (void)backHome
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)shareInfomation
{
    if ([MFMessageComposeViewController canSendText]) {
        MFMessageComposeViewController *messageCon = [[MFMessageComposeViewController alloc] init];
        [messageCon setBody:[[_dataArray objectAtIndex:0] objectForKey:@"context"]];
        messageCon.messageComposeDelegate = self;
        [self presentModalViewController:messageCon animated:YES];
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"您的设备不能发送短信！"
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        [alert show];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.tableView.contentInset = UIEdgeInsetsMake(5, 0, 0, 0);
    
    XLCompanyService *service = [[XLCompanyService alloc] init];
    _company = [service getExpressCompanyById:_express.companyId];
    
    self.title = [NSString stringWithFormat:@"%@-%@",_company.name,_express.expressNo];
    
#ifdef FREE_VERSION
    [self addYoumiWall];
#else
    self.tableView.frame = self.view.bounds;
#endif
}

- (void)addYoumiWall
{
    YouMiView *adView = [[YouMiView alloc] initWithContentSizeIdentifier:YouMiBannerContentSizeIdentifier320x50 delegate:self];
    [adView start];
    
    [self.view addSubview:adView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self requestData];
}

- (void)refreshInfo
{
    [self requestData];
}

- (void)requestData
{
    
#ifdef FREE_VERSION
    //判断积分是否够
    NSInteger score = [_dao findScore];
    if (score < 50) {
        NSString *meg = [NSString stringWithFormat:@"您当前的积分为%d，已经不足使用5次了！",score];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:meg
                                                       delegate:self
                                              cancelButtonTitle:@"更多积分"
                                              otherButtonTitles:@"确定",nil];
        [alert show];
    }else if (score < 10){
        NSString *meg = [NSString stringWithFormat:@"您当前的积分为%d，已经不足使用1次了！",score];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:meg
                                                       delegate:self
                                              cancelButtonTitle:@"更多积分"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
#endif
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    __weak XLFormDataRequest *req = [XLFormDataRequest requestWithURL:API_URL];
    [req addPostValue:_company.code forKey:@"com"];
    [req addPostValue:_express.expressNo forKey:@"nu"];
    
    [req setCompletionBlock:^{
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSLog(@"%@",req.responseString);
        NSDictionary *resultDic = [req.responseString JSONValue];
        if ([[resultDic objectForKey:@"status"] intValue] == 0) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                            message:[resultDic objectForKey:@"message"]
                                                           delegate:nil
                                                  cancelButtonTitle:@"确定"
                                                  otherButtonTitles:nil];
            [alert show];
        }else{
#ifdef FREE_VERSION
            //更新积分
            int score = [_dao findScore];
            score -= 10;
            [_dao updateScore:score];
#endif
            _dataArray = [resultDic objectForKey:@"data"];
            [_tableView reloadData];
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, _tableView.contentSize.height, 320, 30)];
            label.textColor = ORANGE_COLOR;
            label.textAlignment = UITextAlignmentCenter;
            label.font = [UIFont systemFontOfSize:18];
            label.backgroundColor = [UIColor clearColor];
            label.text = @"数据由友商快递100提供";
            [_tableView addSubview:label];
        }
    }];
    
    [req setFailedBlock:^{
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"请检查网络连接或联系管理员！"
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        [alert show];
    }];
    
    [req startAsynchronous];
}

#pragma mark - UITableViewDataSource & UITableViewDelegate
//datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XLExpressInfoCell *cell = nil;
    static NSString *cellId = @"XLExpressInfoCell";
    cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        cell = [[XLExpressInfoCell alloc] initWithStyle:nil reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    NSDictionary *dic = [_dataArray objectAtIndex:indexPath.row];
    cell.time = [dic objectForKey:@"time"];
    cell.context = [dic objectForKey:@"context"];
    
    return cell;
}

//delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = [_dataArray objectAtIndex:indexPath.row];
    return [XLExpressInfoCell calCellHeight:[dic objectForKey:@"context"]];
}

#pragma mark - MFMessageComposeViewControllerDelegate
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    [controller dismissModalViewControllerAnimated:YES];
    
    UIAlertView *alert;
    
    switch (result) {
        case MessageComposeResultCancelled:
            break;
        case MessageComposeResultSent:
            alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                               message:@"发送成功！"
                                              delegate:nil
                                     cancelButtonTitle:@"确定"
                                     otherButtonTitles:nil];
            break;
        case MessageComposeResultFailed:
            alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                               message:@"发送失败！"
                                              delegate:nil
                                     cancelButtonTitle:@"确定"
                                     otherButtonTitles:nil];
            break;
        default:
            break;
    }
    
    [alert show];
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        XLAppsController *appsCon = [[XLAppsController alloc] init];
        [self presentModalViewController:appsCon animated:YES];
    }
}

#pragma mark - YouMiDelegate
- (void)didReceiveAd:(YouMiView *)adView
{
    Debug(@"success");
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.25];
    CGRect rect = self.tableView.frame;
    rect.origin.y += 50;
    rect.size.height -= 50;
    self.tableView.frame = rect;
    [UIView commitAnimations];
}

- (void)didFailToReceiveAd:(YouMiView *)adView  error:(NSError *)error
{
    Debug(@"fail");
    
    [adView removeFromSuperview];
}

@end
