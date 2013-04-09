//
//  XLExpressCompanyCell.m
//  EXTrace
//
//  Created by xie liang on 3/8/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLExpressCompanyCell.h"

@implementation XLExpressCompanyCell

@synthesize logoView = _logoView;
@synthesize bgView = _bgView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _bgView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, 310, 65)];
        _bgView.image = [[UIImage imageNamed:@"cell_bg.png"] stretchableImageWithLeftCapWidth:10 topCapHeight:10];
        [self insertSubview:_bgView belowSubview:self.contentView];
        
        _logoView = [[EGOImageView alloc] initWithFrame:CGRectMake(10, 4, 52, 52)];
        [self.contentView addSubview:_logoView];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.textLabel.font = [UIFont systemFontOfSize:18];
        self.textLabel.textColor = GRAY_COLOR;
        
        self.detailTextLabel.textColor = ORANGE_COLOR;
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    
    if (highlighted) {
        _bgView.image = [[UIImage imageNamed:@"cell_sel.png"] stretchableImageWithLeftCapWidth:10 topCapHeight:10];
    }else{
        _bgView.image = [[UIImage imageNamed:@"cell_bg.png"] stretchableImageWithLeftCapWidth:10 topCapHeight:10];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect rect = self.textLabel.frame;
    rect.origin.x += 57;
    rect.origin.y -= 2;
    self.textLabel.frame = rect;
    
    rect = self.detailTextLabel.frame;
    rect.origin.x += 57;
    self.detailTextLabel.frame = rect;
}

@end
