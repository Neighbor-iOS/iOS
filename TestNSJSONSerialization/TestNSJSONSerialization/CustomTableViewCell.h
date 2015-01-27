//
//  CustomTableViewCell.h
//  TestNSJSONSerialization
//
//  Created by 이대복 on 2015. 1. 5..
//  Copyright (c) 2015년 이대복. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *customLabelName;
@property (weak, nonatomic) IBOutlet UILabel *customLabelUrl;
@property (weak, nonatomic) IBOutlet UILabel *customLabelPhone;
@property (weak, nonatomic) IBOutlet UILabel *customLabelEmail;
@property (weak, nonatomic) IBOutlet UIProgressView *customProgress;
@property (weak, nonatomic) IBOutlet UIImageView *customImg;
@end
