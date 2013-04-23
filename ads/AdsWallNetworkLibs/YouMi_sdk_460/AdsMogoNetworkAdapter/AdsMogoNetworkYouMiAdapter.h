//
//  AdsMogoNetworkYouMiAdapter.h
//  TestIntegralWall
//
//  Created by Daxiong on 13-2-21.
//  Copyright (c) 2013年 Mogo. All rights reserved.
//

#import "AdsMogoNetworkAdapter.h"
#import "YouMiWall.h"
#import "YouMiWallAppModel.h"
#import "YouMiWallDelegateProtocol.h"
@interface AdsMogoNetworkYouMiAdapter : AdsMogoNetworkAdapter<YouMiWallDelegate>{
    YouMiWall *wall;
    BOOL isRequested;
}

@end
