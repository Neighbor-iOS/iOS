//
//  ViewController.m
//  TestMultiStoryBoard
//
//  Created by bokgoon on 2015. 2. 3..
//  Copyright (c) 2015년 bokgoon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)goToSettings{
    UIStoryboard *settingsSB = [UIStoryboard storyboardWithName:@"SettingsStoryboard" bundle:nil];
    
    UIViewController *initialSettingsVC = [settingsSB instantiateInitialViewController];

//    UIViewController *initialSettingsVC = [settingsSB instantiateViewControllerWithIdentifier:@"SettingsStoryboard"];
    initialSettingsVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:initialSettingsVC animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
