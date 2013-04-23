//
//  DMOfferWallViewController.h
//  DomobOfferWallSDK
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

// 消费结果状态码
typedef enum {
    // 消费成功
    DMOfferWallConsumeStatusCodeSuccess = 1,
    // 剩余积分不足
    DMOfferWallConsumeStatusCodeInsufficient,
    // 订单重复
    DMOfferWallConsumeStatusCodeDuplicateOrder
} DMOfferWallConsumeStatusCode;

@protocol DMOfferWallDelegate <NSObject>
// 积分墙开始加载数据。
// Offer wall starts to work.
- (void)offerWallDidStartLoad;
// 积分墙加载完成。此方法实现中可进行积分墙入口Button显示等操作。
// Load offer wall successfully. You can set your IBOutlet.hidden to NO in this callback.
// This IBOutlet is the one which response to present OfferWall.
- (void)offerWallDidFinishLoad;
// 积分墙加载失败。可能的原因由error部分提供，例如网络连接失败、被禁用等。建议在此隐藏积分墙入口Button。
// Failed to load offer wall. You should set THE IBOutlet.hidden to YES in this callback.
- (void)offerWallDidFailLoadWithError:(NSError *)error;
// 关闭积分墙页面。
// Offer wall closed.
- (void)offerWallDidClosed;
#pragma mark Point Check Callbacks
// 积分查询成功之后，回调该接口，获取总积分和总已消费积分。
- (void)offerWallDidFinishCheckPointWithTotalPoint:(NSInteger)totalPoint
                             andTotalConsumedPoint:(NSInteger)consumed;
// 积分查询失败之后，回调该接口，返回查询失败的错误原因。
- (void)offerWallDidFailCheckPointWithError:(NSError *)error;
#pragma mark Consume Callbacks
// 消费请求正常应答后，回调该接口，并返回消费状态（成功或余额不足），以及总积分和总已消费积分。
- (void)offerWallDidFinishConsumePointWithStatusCode:(DMOfferWallConsumeStatusCode)statusCode
                                  totalPoint:(NSInteger)totalPoint
                                  totalConsumedPoint:(NSInteger)consumed;
// 消费请求异常应答后，回调该接口，并返回异常的错误原因。
- (void)offerWallDidFailConsumePointWithError:(NSError *)error;
@end

@interface DMOfferWallViewController : UIViewController

@property (nonatomic,assign) NSObject<DMOfferWallDelegate> *delegate;

// 使用Publisher ID初始化积分墙ViewController
// Create OfferWallViewController with your own Publisher ID
- (id)initWithPublisherID:(NSString *)publisherID;

// 使用Publisher ID和应用当前登陆用户的User ID（或其它的在应用中唯一标识用户的ID）初始化积分墙ViewController
// Create OfferWallViewController with your own Publisher ID and User ID.
- (id)initWithPublisherID:(NSString *)publisherID andUserID:(NSString *)userID;

// 加载积分墙数据。积分墙进行列表数据请求并准备好显示。
// 在调用load之前可以将controller中的delegate设置为实现DMOfferWallDelegate protocol的实例（如self）
// 以便接收到积分墙加载过程中的各个事件
// Let offer wall start to work(fetching data or loading cache).
- (void)loadOfferWall;

// 使用App的rootViewController来弹出并显示积分墙。
// DMOfferWallViewController支持开发者通过NavigationController push的方法显示或依赖
// DMOfferWallViewController自己的显示方法。
// Present offer wall in ModelView way with App's rootViewController.
- (void)presentOfferWall;

// 使用开发者传入的UIViewController来弹出显示OfferWallViewController。
// Present OfferWallViewController with developer's controller.
- (void)presentOfferWallWithViewController:(UIViewController *)controller;

#pragma mark Online Usage Methods
// 请求在线积分检查，成功或失败都会回调Online Usage Callbacks中关于point check的相应方法。
- (void)requestOnlinePointCheck;
// 请求在线消费指定积分，成功或失败都会回调Online Usage Callbacks中关于consume的相应方法。
// 请特别注意参数类型为unsigned int，需要消费的积分为非负值。
- (void)requestOnlineConsumeWithPoint:(NSUInteger)pointToConsume;
@end
