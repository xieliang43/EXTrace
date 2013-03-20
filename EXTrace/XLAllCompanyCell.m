//
//  XLAllCompanyCell.m
//  EXTrace
//
//  Created by xie liang on 3/20/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLAllCompanyCell.h"

@implementation XLAllCompanyCell

@synthesize isCommon = _isCommon;
@synthesize delegate = _delegate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.isCommon = nil;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (_isCommon) {
        markBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        markBtn.frame = CGRectMake(270, 15, 30, 30);
        [markBtn addTarget:self action:@selector(changeStatus:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:markBtn];
        if ([_isCommon isEqualToString:@"0"]) {
            [markBtn setImage:[UIImage imageNamed:@"star_n.png"] forState:UIControlStateNormal];
        }else{
            [markBtn setImage:[UIImage imageNamed:@"star_s.png"] forState:UIControlStateNormal];
        }
    }else{
        [markBtn removeFromSuperview];
    }
}

- (void)changeStatus:(UIButton *)sender
{
    if ([_delegate respondsToSelector:@selector(changeCompanyStatus:)]) {
        [_delegate changeCompanyStatus:self];
    }
}

@end
