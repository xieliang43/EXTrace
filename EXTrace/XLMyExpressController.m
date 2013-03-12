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

@synthesize tableView = _tableView;

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
    
    service = [[XLExpressService alloc] init];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSArray *tmpA = [service getAllExpress];
    myExpresses = [NSMutableArray arrayWithArray:tmpA];
    
    [self.tableView reloadData];
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
    UIBarButtonItem *leftItem = nil;
    if (self.tableView.isEditing) {
        leftItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editMyExpress:)];
        [self.tableView setEditing:NO animated:YES];
    }else{
        leftItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(editMyExpress:)];
        [self.tableView setEditing:YES animated:YES];
    }
    
    self.navigationItem.leftBarButtonItem = leftItem;
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
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
//datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [myExpresses count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    static NSString *cellId = @"express_cell";
    cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
        cell.backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 70)];
        cell.backgroundView.backgroundColor = make_color(255, 255, 255, 1);
        
        cell.textLabel.font = [UIFont boldSystemFontOfSize:18];
        cell.textLabel.textColor = make_color(120, 120, 120, 1);
        
        cell.detailTextLabel.font = [UIFont systemFontOfSize:16];
        cell.detailTextLabel.textColor = make_color(225, 135, 83, 1);
        
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        
        UIImageView *seperator = [[UIImageView alloc] initWithFrame:CGRectMake(0, 69, 320, 1)];
        seperator.image = [UIImage imageNamed:@"line.png"];
        [cell.backgroundView addSubview:seperator];
    }
    
    XLExpress *exp = [myExpresses objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"单号：%@",exp.expressNo];
    cell.detailTextLabel.text = exp.description;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    XLExpress *exp = [myExpresses objectAtIndex:indexPath.row];
    if ([service deleteExpress:exp]) {
        [myExpresses removeObject:exp];
        
        [tableView beginUpdates];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationLeft];
        [tableView endUpdates];
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"删除快递失败！"
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        [alert show];
    }
}

//delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    XLShowExpressInfoController *expressInfoCon = [[XLShowExpressInfoController alloc] initWithNibName:@"XLShowExpressInfoController" bundle:nil];
    expressInfoCon.express = [myExpresses objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:expressInfoCon animated:YES];
}

@end
