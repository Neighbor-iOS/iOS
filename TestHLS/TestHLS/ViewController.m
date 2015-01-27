//
//  ViewController.m
//  TestHLS
//
//  Created by 이대복 on 2015. 1. 13..
//  Copyright (c) 2015년 이대복. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()
@property (strong, nonatomic) MPMoviePlayerController *streamPlayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURL *streamURL = [NSURL URLWithString:@"http://www.thumbafon.com/code_examples/video/segment_example/prog_index.m3u8"];
    
    _streamPlayer = [[MPMoviePlayerController alloc] initWithContentURL:streamURL];
    
    // depending on your implementation your view may not have it's bounds set here in that case consider calling the following 4 msgs later
    
    self.streamPlayer.view.frame = self.customView.bounds;
    
    self.streamPlayer.controlStyle = MPMovieControlStyleEmbedded;

    
    [self.customView addSubview: self.streamPlayer.view];
    
    [self.playButton setTitle:@"Play" forState:UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goPlay:(id)sender {
    NSLog(@"play=====%@",self.playButton.titleLabel.text);
    if([self.playButton.titleLabel.text isEqual:@"Pause"]){
        [self.streamPlayer pause];
        [self.playButton setTitle:@"Play" forState:UIControlStateNormal];
    }else{
        [self.streamPlayer play];
        [self.playButton setTitle:@"Pause" forState:UIControlStateNormal];
    }
}
- (IBAction)goSeek:(id)sender {
    NSLog(@"seek=======%d",(int)self.seekBar.value);
    
}

- (IBAction)stopPlay:(id)sender {
    NSLog(@"play=====Stop");
    [self.streamPlayer stop];
    [self.playButton setTitle:@"Play" forState:UIControlStateNormal];
}

- (IBAction)fullScreen:(id)sender {
    if(self.streamPlayer.isFullscreen){
        
    }else{
        [self.streamPlayer setFullscreen:TRUE];
    }
}


@end
