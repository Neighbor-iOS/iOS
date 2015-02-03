//
//  ViewController.h
//  EduttoTemplate
//
//  Created by 강민우 on 2015. 2. 3..
//  Copyright (c) 2015년 강민우. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *leftTableView;
@property (strong, nonatomic) IBOutlet UITableView *centerTableView;
@property (strong, nonatomic) IBOutlet UITableView *rightTableView;

@end

