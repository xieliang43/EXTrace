//
//  WapsHintView.h
//  WapsOfferLib
//
//  Created by guang on 12-11-26.
//  Copyright (c) 2012年 celles.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AppConnect.h"

@class WapsHintRequestHandler;

@interface WapsHintView : UIView <WapsFetchResponseDelegate> {
    WapsHintRequestHandler *hintViewObj_;
}
-(id)getHintViewWithView:(UIView *)view TOP:(BOOL)isTop_;
@property(nonatomic, retain) WapsHintRequestHandler *hintViewObj;
@end

@interface AppConnect(WapsHintView)

+ (id)showHintView:(UIView *)view  TOP:(BOOL)isTop_;

@end

