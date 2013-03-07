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

- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"扫描单号";
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 460-44-46)];
    self.view.backgroundColor = [UIColor redColor];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    ZBarImageScanner *scanner = [ZBarImageScanner new];
    [scanner setSymbology:ZBAR_PARTIAL config:0 to:0];
    reader = [[ZBarReaderView alloc] initWithImageScanner:scanner];
    
    reader.readerDelegate = self;
    
    reader.frame = CGRectMake(0, 0, 320, 460-44-46);
    reader.backgroundColor = [UIColor redColor];
    reader.torchMode = AVCaptureTorchModeOff;
    
    [self.view addSubview:reader];
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

@end
