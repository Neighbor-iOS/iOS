//
//  ViewController.m
//  LayoutCompare
//
//  Created by 강민우 on 2015. 1. 9..
//  Copyright (c) 2015년 강민우. All rights reserved.
//

#import "ViewController.h"
#import "AutoViewController.h"
#import "NormalViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)autoLayout:(id)sender {
    AutoViewController *autoViewController = [[AutoViewController alloc]initWithNibName:@"AutoViewController" bundle:nil];
    //[self presentViewController:autoViewController animated:YES completion:nil];
    [self.navigationController pushViewController:autoViewController animated:YES];}

- (IBAction)normalLayout:(id)sender {
    NormalViewController *normalViewController = [[NormalViewController alloc]initWithNibName:@"NormalViewController" bundle:nil];
    //[self presentViewController:normalViewController animated:YES completion:nil];
    [self.navigationController pushViewController:normalViewController animated:YES];
}
@end
