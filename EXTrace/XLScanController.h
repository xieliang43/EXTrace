//
//  XLScanController.h
//  EXTrace
//
//  Created by xie liang on 3/7/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import "XLViewController.h"
#import "ZBarSDK.h"

@protocol XLScanControllerDelegate;

@interface XLScanController : XLViewController<ZBarReaderViewDelegate>
{
    ZBarReaderView *reader;
    SystemSoundID soundID;
}

@property (nonatomic,weak) id<XLScanControllerDelegate> delegate;

@end

@protocol XLScanControllerDelegate <NSObject>

@optional
- (void)didGetContent:(NSString *)content;

@end
