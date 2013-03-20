//
//  XLAllCompanyCell.h
//  EXTrace
//
//  Created by xie liang on 3/20/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLExpressCompanyCell.h"

@protocol XLAllCompanyCellDelegate;

@interface XLAllCompanyCell : XLExpressCompanyCell
{
    UIButton *markBtn;
}

@property (nonatomic,strong) NSString *isCommon;
@property (nonatomic,weak) id<XLAllCompanyCellDelegate> delegate;

@end

@protocol XLAllCompanyCellDelegate <NSObject>

@required
- (void)changeCompanyStatus:(XLAllCompanyCell *)cell;

@end
