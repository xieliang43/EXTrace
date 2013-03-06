//
//  XLTabBarController.h
//  EXTrace
//
//  Created by xie liang on 3/6/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XLTabBarController : UIViewController
{
    UIView *_tabBarView;
    UIView *_contentView;
    
    NSInteger _selectIndex;
}

@property (nonatomic,strong) NSArray *controllers;
@property (nonatomic,assign,setter = setSelectIndex:) NSInteger selectIndex;

@end
