//
//  ExpandingCell.h
//  TestExpandableTableView
//
//  Created by 이대복 on 2015. 1. 5..
//  Copyright (c) 2015년 이대복. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExpandingCell : UITableViewCell

@property (strong,nonatomic) IBOutlet UILabel *titleLabel;
@property (strong,nonatomic) IBOutlet UILabel *subtitleLabel;
@property (strong,nonatomic) IBOutlet UILabel *textLabel;
@property (strong,nonatomic) IBOutlet UILabel *calculationLabel;
@property (strong,nonatomic) IBOutlet UILabel *fruitLabel;
@property (strong,nonatomic) IBOutlet UILabel *calcLabel;
@end
