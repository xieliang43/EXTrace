//
//  XLExpressInfoCell.m
//  EXTrace
//
//  Created by xie liang on 3/21/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLExpressInfoCell.h"

@implementation XLExpressInfoCell

@synthesize time = _time;
@synthesize context = _context;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleSubtitle
                reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        bgImage = [[UIImage imageNamed:@"cell_bg.png"] stretchableImageWithLeftCapWidth:10 topCapHeight:10];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    
    CGRect rt = CGRectMake(5, 0, 310, self.bounds.size.height);
    [bgImage drawInRect:rt];
    
    CGContextSetFillColorWithColor(ctx, ORANGE_COLOR.CGColor);
    CGSize size = [_time sizeWithFont:[UIFont boldSystemFontOfSize:16]];
    [_time drawAtPoint:CGPointMake(10, 5) withFont:[UIFont boldSystemFontOfSize:16]];
    
    CGContextSetFillColorWithColor(ctx, GRAY_COLOR.CGColor);
    CGSize size1 = [_context sizeWithFont:[UIFont systemFontOfSize:16]
                        constrainedToSize:CGSizeMake(300, 999)
                            lineBreakMode:NSLineBreakByWordWrapping];
    CGRect rect1 = CGRectMake(10, size.height + 10, 300, size1.height);
    [_context drawInRect:rect1
                withFont:[UIFont systemFontOfSize:16]
           lineBreakMode:NSLineBreakByWordWrapping];
    
    CGContextRestoreGState(ctx);
}

+ (float)calCellHeight:(NSString *)content
{
    CGSize size = [content sizeWithFont:[UIFont systemFontOfSize:16]
                       constrainedToSize:CGSizeMake(300, 999)
                           lineBreakMode:NSLineBreakByWordWrapping];
    
    return size.height + 20 + 25;
}

@end
