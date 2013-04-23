//
//  AdMoGoAdWallNetworkRegistry.h
//  MOGOIntegralWallSDK
//
//  Created by Daxiong on 12-12-17.
//  Copyright (c) 2012年 Daxiong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AdsMoGoWallClassWrapper.h"

@interface AdsMoGoAdWallNetworkRegistry : NSObject{
    
    NSMutableDictionary *adapterDict;
    
}
+ (AdsMoGoAdWallNetworkRegistry *)sharedRegistry;
- (void)registerClass:(Class)adapterClass;
- (AdsMoGoWallClassWrapper *)adapterClassFor:(NSInteger)adNetworkType;
@end
