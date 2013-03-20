//
//  XLAddExpressController.h
//  EXTrace
//
//  Created by xie liang on 3/7/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLViewController.h"
#import "XLScanController.h"
#import "XLCompanyListController.h"
#import "XLExpressCompany.h"
#import "XLExpressService.h"
#import "XLShowExpressInfoController.h"

@interface XLAddExpressController : XLViewController<UITextFieldDelegate,XLScanControllerDelegate,XLCompanyListControllerDelegate>
{
    __strong XLExpressCompany *_company;
    __strong XLExpressService *_service;
}

@property (nonatomic,weak) IBOutlet UITextField *numberField;
@property (nonatomic,weak) IBOutlet UITextField *companyField;
@property (nonatomic,weak) IBOutlet UITextField *descField;
@property (nonatomic,strong) XLExpressCompany *company;

- (IBAction)scanBarcode:(id)sender;

@end
