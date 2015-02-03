//
//  ForthViewController.m
//  TabBar - Use Xib
//
//  Created by 강민우 on 2015. 2. 2..
//  Copyright (c) 2015년 강민우. All rights reserved.
//

#import "ForthViewController.h"

@interface ForthViewController ()

@end

@implementation ForthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIImage *image = [UIImage imageNamed:@"w020.jpg"];
    [_imageView setFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    NSLog(@"_imageView.width : %f", _imageView.frame.size.width);
    NSLog(@"_imageView.width : %f", _imageView.frame.size.height);
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

@end
