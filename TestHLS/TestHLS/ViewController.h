//
//  ViewController.h
//  TestHLS
//
//  Created by 이대복 on 2015. 1. 13..
//  Copyright (c) 2015년 이대복. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *customView;

@property (weak, nonatomic) IBOutlet UIButton *playButton;
- (IBAction)goPlay:(id)sender;
@property (weak, nonatomic) IBOutlet UISlider *seekBar;
- (IBAction)goSeek:(id)sender;
- (IBAction)stopPlay:(id)sender;
- (IBAction)fullScreen:(id)sender;
@end

