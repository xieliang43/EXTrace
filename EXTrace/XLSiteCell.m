//
//  XLSiteCell.m
//  EXTrace
//
//  Created by xie liang on 3/20/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLSiteCell.h"

@implementation XLSiteCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(270, 15, 30, 30);
        [btn setImage:[UIImage imageNamed:@"phone.png"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(makeCall) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn];
    }
    return self;
}

- (void)makeCall
{
    NSString *str = [NSString stringWithFormat:@"tel://%@",self.detailTextLabel.text];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

@end
