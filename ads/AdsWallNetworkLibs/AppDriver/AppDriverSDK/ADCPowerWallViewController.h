//
//  ADCPowerWallViewController.h
//  AppDriverBanner
//
//  Created by song duan on 12-5-16.
//  Copyright (c) 2012年 adways. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADCUrlImageQueueDelegate.h"
#import "ADCProtocolEngineDelegate.h"
#import "ADCADCPowerWallViewControllerDelegate.h"

@class ADCUrlImageQueue;
@class ADCApp;

@interface ADCPowerWallViewController : UIViewController <ADCUrlImageQueueDelegate, ADCProtocolEngineDelegate,
UITableViewDelegate, UITableViewDataSource>
{
    NSString                    *_userIdentifier;
    NSString                    *_siteId;
    NSString                    *_siteKey;
    NSString                    *_mediaId;
    BOOL                        _useReward;
    BOOL                        _useSandBox;
    BOOL                        _needRefreshUI;
    id<ADCADCPowerWallViewControllerDelegate> _delegate;
    
@private
    ADCUrlImageQueue            *_urlImageQueue;
    NSInteger                   _loadedUIImageCount;
    BOOL                        _isUnload;
    NSMutableArray              *_requestIDArray;
    NSInteger                   _selectedIndex;
    NSMutableArray              *_needShowAppArray;
    NSString                    *_timestampString;
    NSMutableDictionary         *_reportedAppInfoDictionary;
    
    float                       _currentScore;
    NSInteger                   _actionCount;
    BOOL                        _customPowerWallUI;
    BOOL                        _iOSAppListLoading;
    BOOL                        _moreIOSApp;
    BOOL                        _thereIsNotAppFlag;
    CGPoint                     _iOSAppOffset;
    
    BOOL                        _sponsorLoading;
    BOOL                        _moreSponsor;
    BOOL                        _thereIsNotSponsorFlag;
    CGPoint                     _sponsorOffset;
    
    BOOL                        _isFirstAppear;
    BOOL                        _loadingScore;
    NSMutableArray              *_getScoreRequestIDArray;
    NSMutableArray              *_sponsorAppArray;
    NSInteger                   _loadScoreErrorTimes;
    NSInteger                   _loadAppErrorTimes;
    NSInteger                   _loadSponsorErrorTimes;
    ADCApp                      *_selectedApp;
}

@property (nonatomic, copy) NSString *userIdentifier;
@property (nonatomic, copy) NSString *siteId;
@property (nonatomic, copy) NSString *siteKey;
@property (nonatomic, copy) NSString *mediaId;
@property (nonatomic, assign) BOOL useReward;
@property (nonatomic, assign) BOOL useSandBox;
@property (nonatomic, assign) BOOL needRefreshUI;
@property (nonatomic, assign) id<ADCADCPowerWallViewControllerDelegate> delegate;

/*
 function: 创建并返回一个新的ADCPowerWallViewController实例。
 parameter: @siteId， AppDriver生成，开发者从AppDriver网站上可获得。
            @siteKey，AppDriver生成，开发者从AppDriver网站上可获得。
            @mediaId，AppDriver生成，开发者从AppDriver网站上可获得。
            @userIdentifier，标识一个用户的变量。你可以给不同的用户设置不同的值。这是一个可选参数。
            @sandBox，NO用正式环境，YES用测试环境。
            @useReward，YES使用AppDriver的积分系统，NO不使用AppDriver的积分系统。
            @powerWallViewControllerDelegate， ADCADCPowerWallViewControllerDelegate
 retrun value: ADCPowerWallViewController 对象
 */
+ (ADCPowerWallViewController *)initWithSiteId:(NSString *)siteId
    siteKey:(NSString *)siteKey
    mediaId:(NSString *)mediaId
    userIdentifier:(NSString *)userIdentifier 
    useSandBox:(BOOL)useSandBox
    useReward:(BOOL)useReward
    powerWallViewControllerDelegate:(id)powerWallViewControllerDelegate;

/*
 function: 创建并返回一个新的ADCPowerWallViewController实例。
 parameter: @viewController，从该UIViewController的界面切换到动力墙界面。
            @siteId， AppDriver生成，开发者从AppDriver网站上可获得。
            @siteKey，AppDriver生成，开发者从AppDriver网站上可获得。
            @mediaId，AppDriver生成，开发者从AppDriver网站上可获得。
            @userIdentifier，标识一个用户的变量。你可以给不同的用户设置不同的值。这是一个可选参数。
            @useReward，YES使用AppDriver的积分系统，NO不使用AppDriver的积分系统。
            @sandBox，NO用正式环境，YES用测试环境。
 retrun value: ADCPowerWallViewController 对象
 */
+ (ADCPowerWallViewController *)showPowerWallViewFromViewController:(UIViewController *)viewController 
                                                             siteId:(NSString *)siteId
                                                            siteKey:(NSString *)siteKey
                                                            mediaId:(NSString *)mediaId
                                                     userIdentifier:(NSString *)userIdentifier 
                                                          useReward:(BOOL)useReward
                                                         useSandBox:(BOOL)useSandBox;

/*
 function: 加载动力墙iPhone App列表（当您需要自定义动力墙UI时使用）。
 parameter: @pageSize，每一页返回数据的大小（条数）。
            @pageNumber，请求哪一页数据。起始页码从1开始。
 */
- (void)loadiOSAppListWithPageSize:(NSInteger)pageSize pageNumber:(NSInteger)pageNumber;

/*
 function: 加载动力墙特别赞助列表（当您需要自定义动力墙UI时使用）。
 parameter: @pageSize，每一页返回数据的大小（条数）。
            @pageNumber，请求哪一页数据。起始页码从1开始。
 */
- (void)loadSponsorAppListWithPageSize:(NSInteger)pageSize pageNumber:(NSInteger)pageNumber;

/*
 function: 使用积分后，对积分进行减操作。
 parameter: @score，需要减掉的积分值。
 retrun value: 减掉积分后的剩余积分，当剩余积分为<=0时都返回0
 */
- (void)reduceScore:(CGFloat)score;

/*
 function: 获得用户的剩余积分。
 */
- (void)getScore;

@end
