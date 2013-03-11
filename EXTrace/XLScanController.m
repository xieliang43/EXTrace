//
//  XLScanController.m
//  EXTrace
//
//  Created by xie liang on 3/7/13.
//  Copyright (c) 2013 xieliang. All rights reserved.
//

#import "XLScanController.h"

@interface XLScanController ()

@end

@implementation XLScanController

@synthesize delegate = _delegate;

- (void)dealloc
{
    AudioServicesDisposeSystemSoundID(soundID);
}

- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"扫描单号";
        
        NSURL *filePath = [[NSBundle mainBundle] URLForResource:@"beep" withExtension:@"wav"];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)filePath, &soundID);
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    self.view.frame = CGRectMake(0, 0, 320, 460-44-46);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    ZBarImageScanner *scanner = [ZBarImageScanner new];
    [scanner setSymbology:ZBAR_PARTIAL config:0 to:0];
    reader = [[ZBarReaderView alloc] initWithImageScanner:scanner];
    reader.readerDelegate = self;
    if (iPhone5) {
        reader.frame = CGRectMake(0, 0, 320, 568-20-44-46);
    }else{
        reader.frame = CGRectMake(0, 0, 320, 480-20-44-46);
    }
    reader.torchMode = AVCaptureTorchModeOff;
    
    [self.view addSubview:reader];
    
    UIImageView *maskView = [[UIImageView alloc] init];
    maskView.image = [UIImage imageNamed:@"scanning.png"];
    maskView.frame = CGRectMake(0, 0, 320, 458);
    if (!iPhone5) {
        maskView.center = self.view.center;
    }
    [self.view addSubview:maskView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [reader start];
}

#pragma mark - ZBarReaderViewDelegate
- (void) readerView:(ZBarReaderView *)readerView didReadSymbols: (ZBarSymbolSet *)symbols fromImage:(UIImage *)image
{
    AudioServicesPlaySystemSound(soundID);
    
    ZBarSymbol * s = nil;
    for (s in symbols)
    {
        NSString *barCode = s.data;
        if ([_delegate respondsToSelector:@selector(didGetContent:)]) {
            [_delegate didGetContent:barCode];
        }
    }
    
    [reader stop];
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
