//
//  ThirdViewController.m
//  TabBar
//
//  Created by 강민우 on 2015. 1. 6..
//  Copyright (c) 2015년 강민우. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController
@synthesize webView;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://211.189.132.45/"]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    if ([[[request URL] absoluteString] hasPrefix:@"ios:"]) {
        [self performSelector:@selector(webToNativeCall)];
        return NO;
    }
    return YES;
}

- (void)webToNativeCall {
    NSString *returnvalue = [webView stringByEvaluatingJavaScriptFromString:@"getText()"];
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"WebMessage" message:returnvalue delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

@end
