//
//  XLCompanyListController.m
//  EXTrace
//
//  Created by xie liang on 3/8/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLCompanyListController.h"

@interface XLCompanyListController ()

@end

@implementation XLCompanyListController

@synthesize tableView = _tableView;
@synthesize delegate = _delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"公司列表";
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    service = [[XLCompanyService alloc] init];
    companys = [service getAllCompany];
    [_tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource & UITableViewDelegate
//datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [companys count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XLExpressCompanyCell *cell = nil;
    static NSString *cellId = @"XLExpressCompanyCell";
    cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"XLExpressCompanyCell" owner:self options:nil] lastObject];
    }
    
    XLExpressCompany *company = [companys objectAtIndex:indexPath.row];
    cell.nameLabel.text = company.name;
    NSString *nameStr = [NSString stringWithFormat:@"%@_s.png",company.image];
    cell.logoView.image = [UIImage imageNamed:nameStr];
    
    return cell;
}

//delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    XLExpressCompany *company = [companys objectAtIndex:indexPath.row];
    if ([_delegate respondsToSelector:@selector(didSelectCompany:)]) {
        [_delegate didSelectCompany:company];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

@end
