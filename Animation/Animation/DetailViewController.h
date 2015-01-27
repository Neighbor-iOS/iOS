//
//  DetailViewController.h
//  Animation
//
//  Created by 강민우 on 2015. 1. 14..
//  Copyright (c) 2015년 강민우. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *aniLabel;
@property (strong, nonatomic) IBOutlet UIImageView *fadeImage;
@property (strong, nonatomic) NSString *aniName;
@property (nonatomic) NSInteger aniIndex;

@end
