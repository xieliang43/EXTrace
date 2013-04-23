//
//  AdsMogoPointDelegate.h
//  TestIntegralWall
//
//  Created by Mogo on 12-12-17.
//  Copyright (c) 2012年 Mogo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AdsMogoPointDelegate <NSObject>

-(void)didGetPoint:(int)aPoint andNetworkAdapterType:(int)type;
-(void)didFaildGetPointNetworkAdapterType:(int)type;

-(void)didSpendPoint:(BOOL)isSuccess;

@end
