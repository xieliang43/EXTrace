//
//  XLExpressCell.m
//  EXTrace
//
//  Created by liang xie on 3/19/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLExpressCell.h"

@implementation XLExpressCell

@synthesize bgView = _bgView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _bgView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, 310, 65)];
        _bgView.image = [[UIImage imageNamed:@"cell_bg.png"] stretchableImageWithLeftCapWidth:10 topCapHeight:10];
        [self insertSubview:_bgView belowSubview:self.contentView];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.textLabel.font = [UIFont boldSystemFontOfSize:18];
        self.textLabel.textColor = GRAY_COLOR;
        
        self.detailTextLabel.font = [UIFont systemFontOfSize:16];
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
    rect.origin.y -= 5;
    self.textLabel.frame = rect;
    
    rect = CGRectMake(5, 0, 310, 60);
    self.contentView.frame = rect;
}

@end
