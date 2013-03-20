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
@synthesize company = _company;

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
    _service = [[XLExpressService alloc] init];
    
    if (_company) {
        self.companyField.text = _company.name;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)saveExpress:(id)sender
{
    if ([_numberField.text length] == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"您还没有输入快递单号！"
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    if ([_companyField.text length] == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"您还没选择快递公司！"
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    if ([_descField.text length] == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"为了更好的管理您的快递，请输入描述信息！"
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    XLExpress *express = [[XLExpress alloc] init];
    express.companyId = _company.cid;
    express.expressNo = _numberField.text;
    express.description = _descField.text;
    
    BOOL result = [_service saveExpress:express];
    if (result) {
        //查看查询结果
        XLShowExpressInfoController *showCon = [[XLShowExpressInfoController alloc] initWithNibName:@"XLShowExpressInfoController" bundle:nil];
        showCon.express = express;
        [self.navigationController pushViewController:showCon animated:YES];
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"添加失败，请重新添加！"
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        [alert show];
    }
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
