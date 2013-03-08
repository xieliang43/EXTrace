//
//  XLCompanyListController.h
//  EXTrace
//
//  Created by xie liang on 3/8/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLViewController.h"
#import "XLExpressCompanyCell.h"
#import "XLCompanyService.h"

@protocol XLCompanyListControllerDelegate;

@interface XLCompanyListController : XLViewController<UITableViewDataSource,UITableViewDelegate>
{
    __strong XLCompanyService *service;
    __strong NSArray *companys;
}

@property (nonatomic,weak) IBOutlet UITableView *tableView;
@property (nonatomic,weak) id<XLCompanyListControllerDelegate> delegate;

@end

@protocol XLCompanyListControllerDelegate <NSObject>

@optional
- (void)didSelectCompany:(XLExpressCompany *)company;

@end