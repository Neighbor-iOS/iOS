//
//  DetailViewController.h
//  CollectionTest
//
//  Created by 강민우 on 2015. 1. 28..
//  Copyright (c) 2015년 강민우. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *detailImage;
@property (strong, nonatomic) NSString *receivedImage;

@end
