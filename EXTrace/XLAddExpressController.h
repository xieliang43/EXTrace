//
//  XLAddExpressController.h
//  EXTrace
//
//  Created by xie liang on 3/7/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLViewController.h"
#import "XLScanController.h"

@interface XLAddExpressController : XLViewController<UITextFieldDelegate>

@property (nonatomic,weak) IBOutlet UITextField *numberField;
@property (nonatomic,weak) IBOutlet UITextField *companyField;
@property (nonatomic,weak) IBOutlet UITextField *descField;

- (IBAction)scanBarcode:(id)sender;

@end
