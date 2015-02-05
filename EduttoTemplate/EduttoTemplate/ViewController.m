//
//  ViewController.m
//  EduttoTemplate
//
//  Created by 강민우 on 2015. 2. 3..
//  Copyright (c) 2015년 강민우. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"

@interface ViewController ()

@property NSArray *sectionList;
@property NSArray *contentList;
@property NSArray *courseList;
@property NSArray *communityList;
@property NSArray *imageList;

@end

@implementation ViewController

@synthesize scrollView;
@synthesize leftTableView;
@synthesize centerTableView;
@synthesize rightTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _sectionList = @[@"Content", @"Course", @"Community"];
    _contentList = @[@"Content no.1", @"Content no.2", @"Content no.3"];
    _courseList = @[@"Course no.1", @"Course no.2", @"Course no.3"];
    _communityList = @[@"Community no.1", @"Community no.2", @"Community no.3"];
    _imageList = @[@"w040.jpg", @"w047.jpg", @"w048.jpg"];
}

- (void)viewDidLayoutSubviews {
    CGFloat contentSize = 200 * 3 + 8 * 2;
    [scrollView setContentSize:CGSizeMake(contentSize, 300)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark TableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (tableView.tag) {
        case 0:
            return _contentList.count;
            
        case 1:
            return _courseList.count;
            
        case 2:
            return _communityList.count;
            
        default:
            return 0;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *sectionTitle;
    switch (tableView.tag) {
        case 0:
            sectionTitle = [_sectionList objectAtIndex:0];
            break;
            
        case 1:
            sectionTitle = [_sectionList objectAtIndex:1];
            break;
            
        case 2:
            sectionTitle = [_sectionList objectAtIndex:2];
            break;
        default:
            sectionTitle = @"";
            break;
    }
    
    return sectionTitle;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    
    CustomTableViewCell *cell = (CustomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"CustomTableViewCell" bundle:nil] forCellReuseIdentifier:cellIdentifier];
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    }
    
    switch (tableView.tag) {
        case 0:
            cell.cellForImage.image = [UIImage imageNamed:[_imageList objectAtIndex:indexPath.row]];
            cell.cellForLabel.text = [_contentList objectAtIndex:indexPath.row];
            cell.cellForSubLabel.text = [_contentList objectAtIndex:indexPath.row];
            break;
            
        case 1:
            cell.cellForImage.image = [UIImage imageNamed:[_imageList objectAtIndex:indexPath.row]];
            cell.cellForLabel.text = [_courseList objectAtIndex:indexPath.row];
            cell.cellForSubLabel.text = [_courseList objectAtIndex:indexPath.row];
            break;
            
        case 2:
            cell.cellForImage.image = [UIImage imageNamed:[_imageList objectAtIndex:indexPath.row]];
            cell.cellForLabel.text = [_communityList objectAtIndex:indexPath.row];
            cell.cellForSubLabel.text = [_communityList objectAtIndex:indexPath.row];
            break;
            
        default:
            cell.cellForImage.image = nil;
            cell.cellForLabel.text = @"";
            cell.cellForSubLabel.text = @"";
            break;
    }
    
    return cell;
}

@end
