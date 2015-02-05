//
//  CustomTableViewCell.m
//  EduttoTemplate
//
//  Created by 강민우 on 2015. 2. 4..
//  Copyright (c) 2015년 강민우. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

@synthesize cellForImage, cellForLabel, cellForSubLabel;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
