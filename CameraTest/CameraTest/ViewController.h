//
//  ViewController.h
//  CameraTest
//
//  Created by 강민우 on 2015. 1. 30..
//  Copyright (c) 2015년 강민우. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *photoView;

- (IBAction)takePhoto:(id)sender;
- (IBAction)selectPhoto:(id)sender;

@end

