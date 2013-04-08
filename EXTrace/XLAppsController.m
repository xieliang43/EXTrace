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
    _apps = [[NSMutableArray alloc] init];
    
    wall = [[YouMiWall alloc] initWithAppID:YOUMI_KEY withAppSecret:YOUMI_SECRET];
    wall.userID = [OpenUDID value];
    wall.delegate = self;
    [wall requestOffersAppData:YES pageCount:10];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - YouMiWallDelegate
- (void)didReceiveOffersAppData:(YouMiWall *)adWall offersApp:(NSArray *)apps
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [_apps addObjectsFromArray:apps];
    [_tableView reloadData];
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
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    YouMiWallAppModel *model = [_apps objectAtIndex:indexPath.row];
    cell.textLabel.text = model.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d",model.points];
    cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:model.smallIconURL]]];
    
    return cell;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // deselect cell
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
