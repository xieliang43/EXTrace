//
//  YouMiWallBanner.h
//  YouMiSDK
//
//  Created by ENZO YANG on 13-1-29.
//  Copyright (c) 2013年 YouMi Mobile Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YouMiWall.h"

//
// 默认大小 320X50
// 默认背景透明，可以像普通的UIView那样设置背景颜色
//
@interface YouMiWallBanner : UIView {
}
// 创建YouMiWallBanner
//
// 输入:
//    wall: 设置好appID, appSecret等属性的YouMiWall对象, 详细请看[YouMiWall.h]
//    isRewarded: 是否是有积分模式
//    unit: 积分单位[比如:"元宝"，"金币" 等等], 默认"奖励", 如果是无积分模式则可只传nil
//
- (id)initWithWall:(YouMiWall *)wall isRewarded:(BOOL)isRewarded unit:(NSString *)unit;

@end
