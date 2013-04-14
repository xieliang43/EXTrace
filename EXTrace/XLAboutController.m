//
//  XLAboutController.m
//  EXTrace
//
//  Created by xie liang on 3/6/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLAboutController.h"

@interface XLAboutController ()

@end

@implementation XLAboutController

@synthesize tableView = _tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"关于我们";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)sendEmail
{
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailCon = [[MFMailComposeViewController alloc] init];
        [mailCon setToRecipients:[NSArray arrayWithObject:@"xieliang43@gmail.com"]];
        [mailCon setSubject:@"快递追踪意见反馈"];
        mailCon.navigationController.navigationBar.tintColor = NAVI_COLOR;
        mailCon.mailComposeDelegate = self;
        [self presentModalViewController:mailCon animated:YES];
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"请到“设置”里面配置邮箱！"
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        [alert show];
    }
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
//datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger *rows = 0;
    
    switch (section) {
        case 0:
            rows = 2;
            break;
        case 1:
            rows = 3;
        default:
            break;
    }
    
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    static NSString *cellId = @"express_cell";
    cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
        cell.backgroundColor = make_color(255, 255, 255, .5);
        
        cell.textLabel.backgroundColor = [UIColor clearColor];
        cell.textLabel.textColor = GRAY_COLOR;
    }
    
    if (indexPath.section == 0) {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        switch (indexPath.row) {
            case 0:
                cell.imageView.image = [UIImage imageNamed:@"person.png"];
                cell.textLabel.text = @"谢亮";
                break;
            case 1:
                cell.imageView.image = [UIImage imageNamed:@"email.png"];
                cell.textLabel.text = @"xieliang43@gmail.com";
                break;
            default:
                break;
        }
    }else{
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        switch (indexPath.row) {
            case 0:
                cell.imageView.image = [UIImage imageNamed:@"advise.png"];
                cell.textLabel.text = @"问题与意见反馈";
                break;
            case 1:
                cell.imageView.image = [UIImage imageNamed:@"comment.png"];
                cell.textLabel.text = @"去评论";
                break;
            case 2:
                cell.imageView.image = [UIImage imageNamed:@"apps.png"];
#ifdef FREE_VERSION
                cell.textLabel.text = @"获取积分";
#else
                cell.textLabel.text = @"更多应用";
#endif
                break;
            default:
                break;
        }
    }
    
    return cell;
}

//delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        return;
    }
    switch (indexPath.row) {
        case 0:
            [self sendEmail];
            break;
        case 1:
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:APP_URL]];
            break;
        case 2:
        {
            XLAppsController *appCon = [[XLAppsController alloc] init];
            UINavigationController *navCon = [[UINavigationController alloc] initWithRootViewController:appCon];
            navCon.navigationBar.tintColor = NAVI_COLOR;
            [self presentModalViewController:navCon animated:YES];
        }
        default:
            break;
    }
}

#pragma mark - MFMailComposeViewControllerDelegate
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [controller dismissModalViewControllerAnimated:YES];
    UIAlertView *alert;
    switch (result) {
        case MFMailComposeResultCancelled:
            break;
        case MFMailComposeResultSaved:
            alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                               message:@"反馈意见保存成功！"
                                              delegate:nil
                                     cancelButtonTitle:@"确定"
                                     otherButtonTitles:nil];
            break;
        case MFMailComposeResultSent:
            alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                               message:@"反馈意见发送成功！"
                                              delegate:nil
                                     cancelButtonTitle:@"确定"
                                     otherButtonTitles:nil];
            break;
        case MFMailComposeResultFailed:
            alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                               message:@"反馈意见发送失败！"
                                              delegate:nil
                                     cancelButtonTitle:@"确定"
                                     otherButtonTitles:nil];
            break;
        default:
            break;
    }
    [alert show];
}

@end
