//
//  XLExpressInfoCell.h
//  EXTrace
//
//  Created by xie liang on 3/21/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XLExpressInfoCell : UITableViewCell
{
    UIImage *bgImage;
}

@property (nonatomic,strong) NSString *time;
@property (nonatomic,strong) NSString *context;

+ (float)calCellHeight:(NSString *)content;

@end
