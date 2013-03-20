//
//  XLEditCompanyController.m
//  EXTrace
//
//  Created by xie liang on 3/20/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLEditCompanyController.h"

@interface XLEditCompanyController ()

@end

@implementation XLEditCompanyController

@synthesize company = _company;
@synthesize nameLabel = _nameLabel;
@synthesize phoneField = _phoneField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"号码修改";
        
        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveNumber)];
        self.navigationItem.rightBarButtonItem = rightItem;
        
        service = [[XLCompanyService alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _nameLabel.text = _company.name;
    _phoneField.text = _company.phone;
    
    [_phoneField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)saveNumber
{
    _company.phone = _phoneField.text;
    if ([service updateCompany:_company]) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"修改号码失败！"
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        [alert show];
    }
}

@end
