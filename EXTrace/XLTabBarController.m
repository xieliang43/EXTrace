//
//  XLTabBarController.m
//  EXTrace
//
//  Created by xie liang on 3/6/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLTabBarController.h"

@interface XLTabBarController ()

@end

@implementation XLTabBarController

@synthesize selectIndex = _selectIndex;
@synthesize controllers = _controllers;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _selectIndex = 0;
        _controllers = nil;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    float height = self.view.bounds.size.height;
    
    _tabBarView = [[UIView alloc] initWithFrame:CGRectMake(0, height - 67, 320, 67)];
    
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, height - 46)];
    _contentView.clipsToBounds = YES;
    
    [self.view addSubview:_contentView];
    [self.view addSubview:_tabBarView];
    
    [self createTabBar];
    [self setSelectIndex:_selectIndex];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setSelectIndex:(NSInteger)index
{
    _selectIndex = index;
    UIButton *btn = (UIButton *)[_tabBarView viewWithTag:_selectIndex+100];
    UIViewController *con = [_controllers objectAtIndex:_selectIndex];
    
    btn.selected = YES;
    
    con.view.frame = _contentView.bounds;
    [_contentView addSubview:con.view];
}

- (void)createTabBar
{
    UIButton *btn0 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn0.tag = 100;
    btn0.frame = CGRectMake(0, 21, 64, 46);
    [btn0 setImage:[UIImage imageNamed:@"bottom_used_nor.png"] forState:UIControlStateNormal];
    [btn0 setImage:[UIImage imageNamed:@"bottom_used_sel.png"] forState:UIControlStateSelected];
    [btn0 addTarget:self action:@selector(selectTab:) forControlEvents:UIControlEventTouchUpInside];
    [_tabBarView addSubview:btn0];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.tag = 101;
    btn1.frame = CGRectMake(64, 21, 64, 46);
    [btn1 setImage:[UIImage imageNamed:@"bottom_all_nor.png"] forState:UIControlStateNormal];
    [btn1 setImage:[UIImage imageNamed:@"bottom_all_sel.png"] forState:UIControlStateSelected];
    [btn1 addTarget:self action:@selector(selectTab:) forControlEvents:UIControlEventTouchUpInside];
    [_tabBarView addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.tag = 102;
    btn2.frame = CGRectMake(128, 0, 64, 71);
    [btn2 setImage:[UIImage imageNamed:@"bottom_oneself_nor.png"] forState:UIControlStateNormal];
    [btn2 setImage:[UIImage imageNamed:@"bottom_oneself_sel.png"] forState:UIControlStateSelected];
    [btn2 addTarget:self action:@selector(selectTab:) forControlEvents:UIControlEventTouchUpInside];
    [_tabBarView addSubview:btn2];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.tag = 103;
    btn3.frame = CGRectMake(192, 21, 64, 46);
    [btn3 setImage:[UIImage imageNamed:@"bottom_number_nor.png"] forState:UIControlStateNormal];
    [btn3 setImage:[UIImage imageNamed:@"bottom_number_sel.png"] forState:UIControlStateSelected];
    [btn3 addTarget:self action:@selector(selectTab:) forControlEvents:UIControlEventTouchUpInside];
    [_tabBarView addSubview:btn3];
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn4.tag = 104;
    btn4.frame = CGRectMake(256, 21, 64, 46);
    [btn4 setImage:[UIImage imageNamed:@"bottom_about_nor.png"] forState:UIControlStateNormal];
    [btn4 setImage:[UIImage imageNamed:@"bottom_about_sel.png"] forState:UIControlStateSelected];
    [btn4 addTarget:self action:@selector(selectTab:) forControlEvents:UIControlEventTouchUpInside];
    [_tabBarView addSubview:btn4];
    
}

- (void)selectTab:(UIButton*)sender
{
    if (sender.tag - 100 == _selectIndex) {
        return;
    }
    UIButton *btn = (UIButton *)[_tabBarView viewWithTag:_selectIndex+100];
    btn.selected = NO;
    
    UIViewController *con = [_controllers objectAtIndex:_selectIndex];
    [con.view removeFromSuperview];
    
    sender.selected = YES;
    _selectIndex = sender.tag-100;
    
    con = [_controllers objectAtIndex:_selectIndex];
    con.view.frame = _contentView.bounds;
    [_contentView addSubview:con.view];
    
}

@end
