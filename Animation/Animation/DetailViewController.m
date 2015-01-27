//
//  DetailViewController.m
//  Animation
//
//  Created by 강민우 on 2015. 1. 14..
//  Copyright (c) 2015년 강민우. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize aniLabel;
@synthesize fadeImage;
@synthesize aniName;
@synthesize aniIndex;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    fadeImage.hidden = YES;
    aniLabel.text = aniName;
}

- (void)viewDidAppear:(BOOL)animated {
    NSArray *imageNames = [NSArray arrayWithObjects:@"win_1.png", @"win_2.png", @"win_3.png", @"win_4.png",
                           @"win_5.png", @"win_6.png", @"win_7.png", @"win_8.png",
                           @"win_9.png", @"win_10.png", @"win_11.png", @"win_12.png",
                           nil];
    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i = 0; i < imageNames.count; i++) {
        [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
    }
    
    switch (aniIndex) {
        case 0:
        {
            fadeImage.hidden = NO;
            [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseIn
                             animations:^{
                                 fadeImage.alpha = 0.0;
                             } completion:^(BOOL finished){
                                 [UIView animateWithDuration:1.0 delay:1.0 options:UIViewAnimationOptionCurveEaseInOut
                                                  animations:^{
                                                      fadeImage.alpha = 1.0;
                                                  } completion:nil];
                             }];
        }
            break;
        case 1: // Normal Motion
        {
            UIImageView *animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 190, 86, 193)];
            animationImageView.animationImages = images;
            animationImageView.animationDuration = 0.5;
            
            [self.view addSubview:animationImageView];
            [animationImageView startAnimating];
        }
            break;
        case 2: // Slow Motion
        {
            UIImageView *animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 190, 86, 193)];
            animationImageView.animationImages = images;
            animationImageView.animationDuration = 5;
            
            [self.view addSubview:animationImageView];
            [animationImageView startAnimating];
        }
            break;
        default:
        {
            
        }
            break;
    }
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
