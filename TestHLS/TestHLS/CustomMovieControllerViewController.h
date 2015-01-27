//
//  CustomMovieControllerViewController.h
//  TestHLS
//
//  Created by 이대복 on 2015. 1. 13..
//  Copyright (c) 2015년 이대복. All rights reserved.
//

#import <MediaPlayer/MediaPlayer.h>

@interface CustomMovieControllerViewController : MPMoviePlayerViewController

@property (weak, nonatomic) IBOutlet UIButton *btnPlayPause;
- (IBAction)actionPlayPause:(id)sender;
- (IBAction)actionStop:(id)sender;
@end
