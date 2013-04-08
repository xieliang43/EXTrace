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
    
#ifdef FREE_VERSION
    [self addYoumiWall];
#endif
    
    CGRect rect = self.tableView.frame;
    rect.origin.y += wallBanner.frame.size.height;
    rect.size.height -= wallBanner.frame.size.height;
    self.tableView.frame = rect;
    
    self.tableView.contentInset = UIEdgeInsetsMake(5, 0, 0, 0);
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

- (void)addYoumiWall
{
    YouMiWall *wallReward = [[YouMiWall alloc] init];
    wallReward.appID = YOUMI_KEY;
    wallReward.appSecret = YOUMI_SECRET;
    
    wallBanner = [[YouMiWallBanner alloc] initWithWall:wallReward isRewarded:YES unit:@"分"];
    wallBanner.backgroundColor = make_color(255, 255, 255, 1);
    wallBanner.frame = CGRectMake(0, 0, wallBanner.frame.size.width, wallBanner.frame.size.height);
    wallBanner.layer.cornerRadius = 4.0f;
    wallBanner.layer.masksToBounds = YES;
    [self.view addSubview:wallBanner];
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

#pragma mark - UITableViewDelegate & UITableViewDataSource
//datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [myExpresses count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XLExpressCell *cell = nil;
    static NSString *cellId = @"express_cell";
    cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[XLExpressCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
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
    return 65.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    XLShowExpressInfoController *expressInfoCon = [[XLShowExpressInfoController alloc] initWithNibName:@"XLShowExpressInfoController" bundle:nil];
    expressInfoCon.express = [myExpresses objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:expressInfoCon animated:YES];
}

@end
