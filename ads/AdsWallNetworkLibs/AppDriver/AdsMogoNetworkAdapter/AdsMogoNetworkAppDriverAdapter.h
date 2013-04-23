//
//  AdsMogoNetworkAppDriverAdapter.h
//  TestIntegralWall
//
//  Created by Mogo on 12-12-26.
//  Copyright (c) 2012年 Mogo. All rights reserved.
//

#import "AdsMogoNetworkAdapter.h"
#import "ADCPowerWallViewController.h"
#import "ADCADCPowerWallViewControllerDelegate.h"
#import "ADCError.h"

@interface AdsMogoNetworkAppDriverAdapter : AdsMogoNetworkAdapter<ADCADCPowerWallViewControllerDelegate>
{
    ADCPowerWallViewController *powerWallViewController;
}

@end
