//
//  ViewController.m
//  EduttoTemplate
//
//  Created by 강민우 on 2015. 2. 3..
//  Copyright (c) 2015년 강민우. All rights reserved.
//

#import "ViewController.h"
#import "LeftTableViewCell.h"
#import "CenterTableViewCell.h"
#import "RightTableViewCell.h"

@interface ViewController ()

@property NSArray *contentList;
@property NSArray *courseList;
@property NSArray *communityList;

@end

@implementation ViewController

@synthesize leftTableView;
@synthesize centerTableView;
@synthesize rightTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _contentList = [NSArray arrayWithObjects:@"Content no.1", @"Content no.2", @"Content no.3", nil];
    _courseList = [NSArray arrayWithObjects:@"Course no.1", @"Course no.2", @"Course no.3", nil];
    _communityList = [NSArray arrayWithObjects:@"Community no.1", @"Community no.2", @"Community no.3", nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark TableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.leftTableView) {
        return 3;
    } else if (tableView == self.centerTableView) {
        return 3;
    } else {
        return 3;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if (tableView == self.leftTableView) {        
        cell.textLabel.text = [_contentList objectAtIndex:indexPath.row];
    } else if (tableView == self.centerTableView) {
        cell.textLabel.text = [_courseList objectAtIndex:indexPath.row];
    } else {
        cell.textLabel.text = [_communityList objectAtIndex:indexPath.row];
    }
    
    return cell;
}

@end
