//
//  CustomTableViewCell.h
//  EduttoTemplate
//
//  Created by 강민우 on 2015. 2. 4..
//  Copyright (c) 2015년 강민우. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *cellForImage;
@property (strong, nonatomic) IBOutlet UILabel *cellForLabel;
@property (strong, nonatomic) IBOutlet UILabel *cellForSubLabel;

@end
