//
//  ViewController.m
//  Animation
//
//  Created by 강민우 on 2015. 1. 13..
//  Copyright (c) 2015년 강민우. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSArray *animationName;
}
@synthesize animationTable;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    animationName = [NSArray arrayWithObjects:@"Alpha + Fade", @"Normal Image Animation", @"Slow Motion Animation", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [animationName count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"AnimationIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [animationName objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showAniDetail"]) {
        NSIndexPath *indexPath = [self.animationTable indexPathForSelectedRow];
        DetailViewController *destViewController = segue.destinationViewController;
        destViewController.aniName = [animationName objectAtIndex:indexPath.row];
        destViewController.aniIndex = indexPath.row;
    }
}

@end
