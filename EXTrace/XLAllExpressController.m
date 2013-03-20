//
//  XLAllExpressController.m
//  EXTrace
//
//  Created by xie liang on 3/6/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLAllExpressController.h"

@interface XLAllExpressController ()

@end

@implementation XLAllExpressController

@synthesize tableView = _tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"所有快递";
        service = [[XLCompanyService alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.tableView.contentInset = UIEdgeInsetsMake(5, 0, 0, 0);
    
}

- (void)viewDidAppear:(BOOL)animated
{
    companys = [service getAllCompany];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
//datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [companys count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XLAllCompanyCell *cell = nil;
    static NSString *cellId = @"express_cell";
    cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[XLAllCompanyCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
        cell.delegate = self;
    }
    
    XLExpressCompany *company = [companys objectAtIndex:indexPath.row];
    
    NSString *str = [NSString stringWithFormat:@"%@_s.png",company.image];
    cell.logoView.image = [UIImage imageNamed:str];
    cell.textLabel.text = company.name;
    cell.isCommon = company.isCommon;
    
    return cell;
}

//delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    XLAddExpressController *addExpress = [[XLAddExpressController alloc] initWithNibName:@"XLAddExpressController" bundle:nil];
    addExpress.company = [companys objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:addExpress animated:YES];
}

#pragma mark - XLAllCompanyCellDelegate
- (void)changeCompanyStatus:(XLAllCompanyCell *)cell
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    XLExpressCompany *company = [companys objectAtIndex:indexPath.row];
    if ([company.isCommon isEqualToString:@"0"]) {
        company.isCommon = @"1";
    }else{
        company.isCommon = @"0";
    }
    
    if ([service updateCompany:company]) {
        [self.tableView beginUpdates];
        
        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationNone];
        
        [self.tableView endUpdates];
    }
}

@end
