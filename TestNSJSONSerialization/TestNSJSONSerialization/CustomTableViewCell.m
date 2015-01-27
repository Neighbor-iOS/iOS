//
//  CustomTableViewCell.m
//  TestNSJSONSerialization
//
//  Created by 이대복 on 2015. 1. 5..
//  Copyright (c) 2015년 이대복. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

@synthesize customLabelName, customLabelUrl, customLabelEmail, customLabelPhone;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
@end
