//
//  XLScanController.h
//  EXTrace
//
//  Created by xie liang on 3/7/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "XLViewController.h"
#import "ZBarSDK.h"

@interface XLScanController : XLViewController<ZBarReaderViewDelegate>
{
    ZBarReaderView *reader;
}

@end
