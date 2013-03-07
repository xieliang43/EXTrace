//
//  XLAddExpressController.m
//  EXTrace
//
//  Created by xie liang on 3/7/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLAddExpressController.h"

@interface XLAddExpressController ()

@end

@implementation XLAddExpressController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"添加快递";
        
        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveExpress:)];
        self.navigationItem.rightBarButtonItem = rightItem;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)saveExpress:(id)sender
{
    
}

@end
