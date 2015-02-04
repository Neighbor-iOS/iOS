//
//  ViewController.h
//  TestMuliTableView
//
//  Created by bokgoon on 2015. 2. 3..
//  Copyright (c) 2015년 bokgoon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>{
    NSArray *item1;
    NSArray *item2;
    NSArray *item3;
}


@property (weak, nonatomic) IBOutlet UITableView *list1;
@property (weak, nonatomic) IBOutlet UITableView *list2;
@property (weak, nonatomic) IBOutlet UITableView *list3;
@end

