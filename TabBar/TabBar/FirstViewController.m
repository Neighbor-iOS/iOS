//
//  FirstViewController.m
//  TabBar
//
//  Created by 강민우 on 2015. 1. 6..
//  Copyright (c) 2015년 강민우. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize webView;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.naver.com"]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
