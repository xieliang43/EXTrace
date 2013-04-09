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
#ifdef FREE_VERSION
        self.title = @"获取积分";
#else
        self.title = @"应用推荐";
#endif
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancleBtn)];
        self.navigationItem.leftBarButtonItem = leftItem;
    }
    return self;
}

- (void)cancleBtn
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _apps = [[NSMutableArray alloc] init];
    
    wall = [[YouMiWall alloc] init];
    wall.delegate = self;
    [wall requestOffersAppData:YES];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    CGRect rect = self.view.bounds;
    rect.size.height -= 44 + 45;
    _tableView.frame = rect;
    _tableView.contentInset = UIEdgeInsetsMake(5, 0, 0, 0);
    [self.view addSubview:_tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

#pragma mark - YouMiWallDelegate
- (void)didReceiveOffersAppData:(YouMiWall *)adWall offersApp:(NSArray *)apps
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [_apps addObjectsFromArray:apps];
    [_tableView reloadData];
}

- (void)didDismissWallView:(YouMiWall *)adWall
{
    Debug(@"请求积分");
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_apps count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Rewarded Cell Identifier";
    
    XLAppsCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[XLAppsCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    YouMiWallAppModel *model = [_apps objectAtIndex:indexPath.row];
    cell.textLabel.text = model.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d",model.points];
    [cell.logoView setImageURL:[NSURL URLWithString:model.smallIconURL]];
    return cell;
}

#pragma mark - Table view delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // deselect cell
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [wall userInstallFeaturedApp:[_apps objectAtIndex:indexPath.row]];
}

@end
