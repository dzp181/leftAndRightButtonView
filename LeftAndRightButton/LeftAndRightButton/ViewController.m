//
//  ViewController.m
//  LeftAndRightButton
//
//  Created by dengzhiping on 2017/2/23.
//  Copyright © 2017年 dengzhiping. All rights reserved.
//

#import "ViewController.h"
#import "LeftAndRightView.h"

@interface ViewController ()<LeftAndRightViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    LeftAndRightView *view = [[LeftAndRightView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 80)];
    view.delegate = self;
    [view setBtnTitles:@[@"左边按钮",@"右边按钮"]];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:view];
}

- (void)didSelectLeftButton{
    NSLog(@"点击左边");
}

- (void)didSelectRightButton{
    NSLog(@"点击右边");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
