//
//  XLEditCompanyController.h
//  EXTrace
//
//  Created by xie liang on 3/20/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLViewController.h"
#import "XLExpressCompany.h"
#import "XLCompanyService.h"

@interface XLEditCompanyController : XLViewController
{
    XLCompanyService *service;
}

@property (nonatomic,strong) XLExpressCompany *company;

@property (nonatomic,weak) IBOutlet UILabel *nameLabel;
@property (nonatomic,weak) IBOutlet UITextField *phoneField;

@end
