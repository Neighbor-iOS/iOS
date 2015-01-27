//
//  ViewController.h
//  TestExpandableTableView
//
//  Created by 이대복 on 2015. 1. 5..
//  Copyright (c) 2015년 이대복. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    int selectedIndex;
    NSMutableArray *titleArray;
    NSArray *subtitleArray;
    NSArray *textarray;
}


@end

