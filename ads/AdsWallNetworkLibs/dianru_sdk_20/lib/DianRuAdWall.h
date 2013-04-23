//
//  DianRuAdWall.h
//  DianRuAdWall
//
//  Created by  on 12-5-25.
//  update by  12-10-9
//  Copyright (c) 2012年 DianRu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@protocol DianRuAdWallDelegate <NSObject>

@required

/*
 用于消费积分结果的回调
 */
-(void)didReceiveSpendScoreResult:(BOOL)isSuccess;

/*
 用于获取剩余积分结果的回调
 */
-(void)didReceiveGetScoreResult:(int)point;


  
 
 @optional

/*
 应用程序唯一标识，从点入后台获取
 */
-(NSString *)applicationKey;

/*
 用户关闭点积分时的回调
 */
-(void)dianruAdWallClose;

/*
 标示用户的程序所支持的设备
    return @"iphone" 标识该App适用于iphone  如果App只适用于iphone必须要实现改方法.
    return @"ipad"   标识该App适用于ipad
    不实现该方法 或 return @"all" 标识该App是通用应用
*/
-(NSString *)dianruAdWallAppType;

/*
 提供用户的id数据..
 */

-(NSString *)dianruAdWallAppUserId;



@end

@interface DianRuAdWall : NSObject<NSURLConnectionDelegate>
{
    
}
/*
 预加载点积分
 */
+(void)beforehandAdWallWithDianRuAppKey:(NSString *)applicationKey;
/*
  初始化协议..
 */
+(void)initAdWallWithDianRuAdWallDelegate:(id<DianRuAdWallDelegate>)delegate;
/*
 查下用户当前的积分..在DianRuAdWallDelegate中回调
 */
+(void)getRemainPoint;

/*
 消费积分
 */
+(void)spendPoint:(int)point;

/*
 显示点积分页面
 */
+(void)showAdWall:(UIViewController*)viewController;

/*
 此方法用于 dianruAdWall 的恢复
 */
+(void)dianruOnResume;

/*
 此方法用于 dianruAdWall 的暂停
 */
+(void)dianruOnPause;





@end
