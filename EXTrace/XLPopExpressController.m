//
//  XLPopExpressController.m
//  EXTrace
//
//  Created by xie liang on 3/6/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLPopExpressController.h"

@interface XLPopExpressController ()

@end

@implementation XLPopExpressController

@synthesize tableView = _tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"常用快递";
        
        service = [[XLCompanyService alloc] init];
        companys = [[NSMutableArray alloc] init];
        
        UIBarButtonItem *editItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editTable:)];
        self.navigationItem.rightBarButtonItem = editItem;
    }
    return self;
}

- (void)editTable:(UIBarButtonItem *)sender
{
    if (self.tableView.editing) {
        [self.tableView setEditing:NO];
        sender = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editTable:)];
    }else{
        [self.tableView setEditing:YES];
        sender = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(editTable:)];
    }
    
    self.navigationItem.rightBarButtonItem = sender;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.tableView.contentInset = UIEdgeInsetsMake(5, 0, 0, 0);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [companys removeAllObjects];
    [companys addObjectsFromArray:[service getPopCompany]];
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
    XLExpressCompanyCell *cell = nil;
    static NSString *cellId = @"express_cell";
    cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[XLExpressCompanyCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    XLExpressCompany *company = [companys objectAtIndex:indexPath.row];
    
    NSString *str = [NSString stringWithFormat:@"%@_s.png",company.image];
    cell.logoView.image = [UIImage imageNamed:str];
    cell.textLabel.text = company.name;
    cell.detailTextLabel.text = company.phone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    XLExpressCompany *company = [companys objectAtIndex:indexPath.row];
    company.isCommon = @"0";
    if ([service updateCompany:company]) {
        [companys removeObject:company];
        
        [tableView beginUpdates];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationLeft];
        [tableView endUpdates];
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"删除常用快递失败！"
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        [alert show];
    }
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

@end
