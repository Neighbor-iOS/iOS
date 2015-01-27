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
@synthesize customView, playButton, seekBar, streamPlayer, controllerView;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    isFullScreen = NO;
    seekTime = 0;
    
    //기본 화면 사이즈 가져오기 / orientation이 바껴도 변하지 않는다.
    windowW = [[UIScreen mainScreen] bounds].size.width;
    windowH = [[UIScreen mainScreen] bounds].size.height;
    
    streamURL = [NSURL URLWithString:@"http://media.blacktrash.org/stsp.m3u8"];
    streamURL = [NSURL URLWithString:@"http://www.playon.tv/online/iphone5/main.m3u8"];
    streamURL = [NSURL URLWithString:@"http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8"];
    streamURL = [NSURL URLWithString:@"http://www.thumbafon.com/code_examples/video/segment_example/prog_index.m3u8"];
    
    streamPlayer = [[MPMoviePlayerController alloc] initWithContentURL:streamURL];
    [self setNotification];
    
    streamPlayer.view.frame = customView.bounds;
    streamPlayer.controlStyle = MPMovieControlStyleNone;
    
    seekBar.maximumValue = 10;
    seekBar.value = 0;
    
    streamPlayer.view.backgroundColor = [UIColor grayColor];
    controllerView.backgroundColor = [UIColor blueColor];
    customView.backgroundColor = [UIColor greenColor];
    
    [streamPlayer.view addSubview:controllerView];
    
    seekBar.frame = CGRectMake(20, streamPlayer.view.frame.size.height-seekBar.frame.size.height-10, streamPlayer.view.frame.size.width-40, seekBar.frame.size.height);
    
    [customView addSubview: streamPlayer.view];
    [customView addSubview: seekBar];
    
    [playButton setTitle:@"Play" forState:UIControlStateNormal];
    
    [self.activityIndicator setIndicatorStyle:WDActivityIndicatorStyleGradient];
    [self.activityIndicator setHidesWhenStopped:YES];
    loadingImgSize = self.activityIndicator.bounds.size.width;
    
    [self customFullScreen:YES];
    
    [self.view bringSubviewToFront:self.activityIndicator];
    [self.activityIndicator stopAnimating];
    
}
-(void)setNotification{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackFinishedCallback:) name:MPMoviePlayerPlaybackDidFinishNotification object:streamPlayer   ];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadStateDidChangeCallback:) name:MPMoviePlayerLoadStateDidChangeNotification object:streamPlayer];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackStateDidChangeCallback:) name:MPMoviePlayerPlaybackStateDidChangeNotification object:streamPlayer];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(TypesAvailableCallback:) name:MPMovieMediaTypesAvailableNotification object:streamPlayer];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(NaturalSizeAvailableCallback:) name:MPMovieNaturalSizeAvailableNotification object:streamPlayer];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SourceTypeAvailableCallback:) name:MPMovieSourceTypeAvailableNotification object:streamPlayer];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(DurationAvailableCallback:) name:MPMovieDurationAvailableNotification object:streamPlayer];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(PlaybackIsPreparedToPlayDidChangeCallback:) name:MPMediaPlaybackIsPreparedToPlayDidChangeNotification object:streamPlayer];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didChangeOrientation:)
                                                 name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];


}
/**********************check orientation start*/
- (void)didChangeOrientation:(NSNotification *)notification
{
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    
    BOOL isLeft = YES;
    BOOL orientationP = YES;
    
    if (UIInterfaceOrientationIsLandscape(orientation)) {
        NSLog(@"-----------------------Landscape");
        if(orientation==UIInterfaceOrientationLandscapeLeft){
            isLeft = YES;
        }else{
            isLeft = NO;
        }
        orientationP = NO;
    }
    else {
        NSLog(@"-----------------------Portrait");
        orientationP = YES;
    }
    
    isFullScreen = !orientationP;
    [self customFullScreen:isLeft];
}
/**********************check orientation end*/
/**********************custom controller start*/
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self controllerHidden];
}
-(void)controllerHidden{
    
    if(controllerView.isHidden){
        //fade in
        //visible
        controllerView.alpha = 0;
        controllerView.hidden = NO;
        seekBar.alpha = 0;
        seekBar.hidden = NO;
        [UIView animateWithDuration:0.5 animations:^{
            controllerView.alpha=1;
            seekBar.alpha=1;
        }];
    }else{
        //fade out
        //gone
        [UIView animateWithDuration:0.5 animations:^{
            controllerView.alpha=0;
            seekBar.alpha=0;
        } completion:^(BOOL finished){
            controllerView.hidden = finished;
            seekBar.hidden = finished;
        }];
    }
}
/**********************custom controller end*/

-(void)PlaybackIsPreparedToPlayDidChangeCallback:(NSNotification*)notification{
    //play time
//    NSLog(@"PlaybackIsPreparedToPlayDidChangeCallback----%d",(int)streamPlayer.currentPlaybackTime);

    if(streamPlayer.duration>0){
        NSLog(@"PlaybackIsPreparedToPlayDidChangeCallback======%d //// %d",(int)streamPlayer.duration, (int)streamPlayer.currentPlaybackTime);
        
        if((int)streamPlayer.duration>(int)streamPlayer.currentPlaybackTime){
            [self performSelector:@selector(PlaybackIsPreparedToPlayDidChangeCallback:) withObject:notification afterDelay:1];
            seekBar.value = streamPlayer.currentPlaybackTime;
        }else{
            [NSObject cancelPreviousPerformRequestsWithTarget:self];
        }
    }
}
-(void)DurationAvailableCallback:(NSNotification*)notification{
    //play time
    NSLog(@"DurationAvailableCallback----%lu",(unsigned long)streamPlayer.timedMetadata.count);
}
-(void)SourceTypeAvailableCallback:(NSNotification*)notification{
    switch((int)streamPlayer.movieMediaTypes){
        case MPMovieSourceTypeUnknown:
            NSLog(@"SourceTypeAvailableCallback----MPMovieSourceTypeUnknown");
            break;
        case MPMovieSourceTypeFile:
            NSLog(@"SourceTypeAvailableCallback----MPMovieSourceTypeFile");
            break;
        case MPMovieSourceTypeStreaming:
            NSLog(@"SourceTypeAvailableCallback----MPMovieSourceTypeStreaming");
            break;
            default:
            NSLog(@"SourceTypeAvailableCallback----%d",streamPlayer.movieSourceType);
            break;
    }
    /*
     0-MPMovieSourceTypeUnknown,
     1-MPMovieSourceTypeFile,     // Local or progressively downloaded network content
     2-MPMovieSourceTypeStreaming // Live or on-demand streaming content
     */
//    NSLog(@"SourceTypeAvailableCallback----%ld",streamPlayer.movieSourceType);
}
-(void)NaturalSizeAvailableCallback:(NSNotification*)notification{
    //view size
//    NSLog(@"NaturalSizeAvailableCallback----%f / %f",streamPlayer.naturalSize.width,streamPlayer.naturalSize.height);
}
-(void)TypesAvailableCallback:(NSNotification*)notification{
    switch ((int)streamPlayer.movieMediaTypes) {
        case MPMovieMediaTypeMaskNone:
            NSLog(@"TypesAvailableCallback----MPMovieMediaTypeMaskNone");
            break;
        case MPMovieMediaTypeMaskVideo:
            NSLog(@"TypesAvailableCallback----MPMovieMediaTypeMaskVideo");
            break;
        case MPMovieMediaTypeMaskAudio:
            NSLog(@"TypesAvailableCallback----MPMovieMediaTypeMaskAudio");
            break;
        default:
            NSLog(@"TypesAvailableCallback----%u",streamPlayer.movieMediaTypes);
            break;
    }
    /**
     MPMovieMediaTypeMaskNone  = 0,
     MPMovieMediaTypeMaskVideo = 1 << 0,
     MPMovieMediaTypeMaskAudio = 1 << 1
     */
//    NSLog(@"TypesAvailableCallback----%lu",streamPlayer.movieMediaTypes);
}
-(void)playbackStateDidChangeCallback:(NSNotification*)notification{
    /**
     0-MPMoviePlaybackStateStopped,
     1-MPMoviePlaybackStatePlaying, loading start when call
     2-MPMoviePlaybackStatePaused, loading stop when call
     3-MPMoviePlaybackStateInterrupted,
     4-MPMoviePlaybackStateSeekingForward,
     5-MPMoviePlaybackStateSeekingBackward
     */
    
    
    switch ((int)streamPlayer.playbackState) {
        case MPMoviePlaybackStateStopped:
            NSLog(@"playbackStateDidChangeCallback----MPMoviePlaybackStateStopped");
            isFullScreen = NO;
            [self customFullScreen:YES];
            break;
        case MPMoviePlaybackStatePlaying:
            NSLog(@"playbackStateDidChangeCallback----MPMoviePlaybackStatePlaying");
            [self.activityIndicator stopAnimating];
            break;
        case MPMoviePlaybackStatePaused:
            NSLog(@"playbackStateDidChangeCallback----MPMoviePlaybackStatePaused");
            break;
        case MPMoviePlaybackStateInterrupted:
            NSLog(@"playbackStateDidChangeCallback----MPMoviePlaybackStateInterrupted");
            break;
        case MPMoviePlaybackStateSeekingForward:
            NSLog(@"playbackStateDidChangeCallback----MPMoviePlaybackStateSeekingForward");
            break;
        case MPMoviePlaybackStateSeekingBackward:
            NSLog(@"playbackStateDidChangeCallback----MPMoviePlaybackStateSeekingBackward");
            break;
            default:
            NSLog(@"playbackStateDidChangeCallback----%d",streamPlayer.playbackState);
            break;
    }
}
-(void)loadStateDidChangeCallback:(NSNotification*)notification{
    //get event when play end
    /**
     play is 3
     MPMovieLoadStateUnknown        = 0,
     MPMovieLoadStatePlayable       = 1 << 0,
     MPMovieLoadStatePlaythroughOK  = 1 << 1, // Playback will be automatically started in this state when shouldAutoplay is YES
     MPMovieLoadStateStalled        = 1 << 2, // Playback will be automatically paused in this state, if started
     */
    NSLog(@"loadStateDidChangeCallback----%u",streamPlayer.loadState);
    switch ((int)streamPlayer.loadState) {
        case MPMovieLoadStateUnknown:
            NSLog(@"loadStateDidChangeCallback----MPMovieLoadStateUnknown");
            break;
        case MPMovieLoadStatePlayable:
            NSLog(@"loadStateDidChangeCallback----MPMovieLoadStatePlayable");
            break;
        case MPMovieLoadStatePlaythroughOK:
            NSLog(@"loadStateDidChangeCallback----MPMovieLoadStatePlaythroughOK");
            break;
        case MPMovieLoadStateStalled:
            NSLog(@"loadStateDidChangeCallback----MPMovieLoadStateStalled");
            break;
        case 5:
            //buffer
            [self.activityIndicator startAnimating];
            [NSObject cancelPreviousPerformRequestsWithTarget:self];
            break;
        default:
            NSLog(@"loadStateDidChangeCallback----%u",streamPlayer.loadState);
            break;
    }
    
    if((int)seekBar.maximumValue==10){
        NSLog(@"loadStateDidChangeCallback----duration====%f",streamPlayer.duration);
        seekBar.maximumValue = streamPlayer.duration;
        
        //전체길이가 있어야 seekbar 셋팅이 가능하다.
        if(seekBar.maximumValue==0 || seekBar.maximumValue==1){
            seekBar.maximumValue = 330 ;
        }
    }
    if(streamPlayer.loadState==3){
//        [self performSelector:@selector(PlaybackIsPreparedToPlayDidChangeCallback:) withObject:notification afterDelay:1];
        [self.activityIndicator stopAnimating];
        if([playButton.titleLabel.text isEqual:@"Play"]){
            [playButton setTitle:@"Pause" forState:UIControlStateNormal];
        }
    }else{
        
    }
}
-(void)playbackFinishedCallback:(NSNotification*)notification{
    //get event when play end
    NSLog(@"playbackFinishedCallback");
    
    int reason = [[[notification userInfo] valueForKey:MPMoviePlayerPlaybackDidFinishReasonUserInfoKey] intValue];
    if (reason == MPMovieFinishReasonPlaybackEnded) {
        //movie finished playin
        NSLog(@"playbackFinishedCallback = movie finished playin");
    }else if (reason == MPMovieFinishReasonUserExited) {
        //user hit the done button
        NSLog(@"playbackFinishedCallback = user hit the done button");
    }else if (reason == MPMovieFinishReasonPlaybackError) {
        //error
        NSError *mediaPlayerError = [[notification userInfo] objectForKey:@"error"];
        NSString *message = @"Some message...";
        
        if (mediaPlayerError){
            NSLog(@"playback failed with error description: %@", [mediaPlayerError localizedDescription]);
            message =[mediaPlayerError localizedDescription];
        }else{
            NSLog(@"playback failed without any given reason");
            message = @"playback failed without any given reason";
        }
        [self showToast:message];
    }
    
    [streamPlayer stop];
    [playButton setTitle:@"Play" forState:UIControlStateNormal];
    seekBar.maximumValue = 10;
    seekBar.value = 0;
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    
    if(isFullScreen){
        isFullScreen = NO;
    }
    [self customFullScreen:YES];
    
    [self.activityIndicator stopAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goPlay:(id)sender {
    NSLog(@"play=====%@",playButton.titleLabel.text);
    if([playButton.titleLabel.text isEqual:@"Pause"]){
        [streamPlayer pause];
        [playButton setTitle:@"Play" forState:UIControlStateNormal];
        [self.activityIndicator stopAnimating];
    }else{
        [streamPlayer play];
        [playButton setTitle:@"Pause" forState:UIControlStateNormal];
        [self.activityIndicator startAnimating];
    }
}

// seek to move
- (IBAction)goSeek:(id)sender {
    NSLog(@"seek=======%d",(int)seekBar.value);
    [streamPlayer setCurrentPlaybackTime:(int)seekBar.value];
}

- (IBAction)stopPlay:(id)sender {
    NSLog(@"play=====Stop");
    [streamPlayer stop];
    streamPlayer.initialPlaybackTime = 0;
    [playButton setTitle:@"Play" forState:UIControlStateNormal];
    [self.activityIndicator stopAnimating];
}
- (BOOL)prefersStatusBarHidden {
    return YES;
}

// set screen size when orientation change etc....
- (void)customFullScreen:(BOOL)left{
    
    if(isFullScreen){
        if(left){
            [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIInterfaceOrientationLandscapeLeft] forKey:@"orientation"];
        }else{
            [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIInterfaceOrientationLandscapeRight] forKey:@"orientation"];
        }
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
        
        [self.activityIndicator setIndicatorStyle:WDActivityIndicatorStyleSegment];
        
        // for device (check iPhone 4 / 5)
//        self.view.frame = CGRectMake(0, 0, windowW, windowH);
//        self.view.bounds = CGRectMake(0, 0, windowH, windowW);
//        customView.frame = CGRectMake(5, 5, self.view.frame.size.height-10, self.view.frame.size.width-10);
        
        // for emulator (check iPhone 4S / 5 / 5S / 6 / 6Plus)
        customView.frame = CGRectMake(5, 5, self.view.frame.size.width-10, self.view.frame.size.height-10);
    }else{
        [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIInterfaceOrientationPortrait] forKey:@"orientation"];
        [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
        
        [self.activityIndicator setIndicatorStyle:WDActivityIndicatorStyleGradient];
        
        self.view.frame = CGRectMake(0, 0, windowW, windowH);
        self.view.bounds = CGRectMake(0, 0, windowW, windowH);
        
        customView.frame = CGRectMake(10, 20, self.view.frame.size.width-20, self.view.frame.size.height/2);
    }
    
    streamPlayer.view.frame = CGRectMake(5, 5, customView.frame.size.width-10, customView.frame.size.height-10);
    
    seekBar.frame = CGRectMake(
                               10,
                               streamPlayer.view.frame.size.height - seekBar.frame.size.height-10,
                               streamPlayer.view.frame.size.width-20,
                               seekBar.frame.size.height);
    
    self.activityIndicator.center = customView.center;
    
}
- (IBAction)fullScreen:(id)sender {
    if(isFullScreen){
        isFullScreen = NO;
    }else{
        isFullScreen = YES;
    }

    [self customFullScreen:YES];
}

- (IBAction)movePlay:(id)sender {
    
    if([playButton.titleLabel.text isEqual:@"Pause"]){
        // is playing
        NSLog(@"seek to 150 in playing");
        [streamPlayer setCurrentPlaybackTime:(streamPlayer.duration/2)];
    }else{
        // ready for play
        NSLog(@"seek to 150 in playable");
        [streamPlayer setInitialPlaybackTime:150];
        [streamPlayer play];
        [playButton setTitle:@"Pause" forState:UIControlStateNormal];
        [self.activityIndicator startAnimating];
    }
}

-(NSInteger)getSeekBarX{
    if(isFullScreen){
       return 0;
    }else{
        return 20;
    }
}
-(NSInteger)getSeehBarH{
    if(isFullScreen){
        return self.view.frame.size.height-seekBar.frame.size.height-40;
    }else{
        return streamPlayer.view.frame.size.height-seekBar.frame.size.height-10;
    }
}
-(NSInteger)getSeekBarWidth{
    return streamPlayer.view.frame.size.width-40;
}
-(NSInteger)getSeekBarHeight{
    return seekBar.frame.size.height;
}

// custom toast
-(void)showToast:(NSString*)msg{
    
    UIAlertView *toast = [[UIAlertView alloc] initWithTitle:nil
                                                    message:msg
                                                   delegate:nil
                                          cancelButtonTitle:nil
                                          otherButtonTitles:nil, nil];
    [toast show];
    
    int duration = 1; // duration in seconds
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [toast dismissWithClickedButtonIndex:0 animated:YES];
    });
}

@end
