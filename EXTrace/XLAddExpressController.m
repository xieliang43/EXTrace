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

@synthesize numberField = _numberField;
@synthesize companyField = _companyField;
@synthesize descField = _descField;

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
    
    [self.numberField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)saveExpress:(id)sender
{
    
}

- (IBAction)scanBarcode:(id)sender
{
    XLScanController *con = [[XLScanController alloc] init];
    con.delegate = self;
    [self.navigationController pushViewController:con animated:YES];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    XLCompanyListController *companyCon = [[XLCompanyListController alloc] initWithNibName:@"XLCompanyListController" bundle:nil];
    companyCon.delegate = self;
    [self.navigationController pushViewController:companyCon animated:YES];
    return NO;
}

#pragma mark - XLScanControllerDelegate
- (void)didGetContent:(NSString *)content
{
    _numberField.text = content;
}

#pragma mark - XLCompanyListControllerDelegate
- (void)didSelectCompany:(XLExpressCompany *)company
{
    _company = company;
    _companyField.text = _company.name;
}

@end
