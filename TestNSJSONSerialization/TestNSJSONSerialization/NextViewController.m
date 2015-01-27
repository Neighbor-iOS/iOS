//
//  NextViewController.m
//  TestNSJSONSerialization
//
//  Created by 이대복 on 2015. 1. 7..
//  Copyright (c) 2015년 이대복. All rights reserved.
//

#import "NextViewController.h"
@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//go back
- (IBAction)goBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
