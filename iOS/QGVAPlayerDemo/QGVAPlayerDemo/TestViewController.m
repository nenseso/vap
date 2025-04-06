//
//  TestViewController.m
//  QGVAPlayerDemo
//
//  Created by nenseso zhou on 2025/4/6.
//  Copyright © 2025 Tencent. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)injected {
#ifdef DEBUG
    [self viewDidLoad];
#endif
}

@end
