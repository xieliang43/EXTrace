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
                cell.textLabel.text = @"更多应用";
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
    
}

@end
