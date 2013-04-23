//
//  AdMoGoWallClassWrapper.h
//  MOGOIntegralWallSDK
//
//  Created by Daxiong on 12-12-17.
//  Copyright (c) 2012年 Daxiong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdsMoGoWallClassWrapper : NSObject{
    Class theClass;
}

- (id)initWithClass:(Class)c;

@property (nonatomic, readonly) Class theClass;

@end
