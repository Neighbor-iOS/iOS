//
//  ViewController.m
//  TestExpandableTableView
//
//  Created by 이대복 on 2015. 1. 5..
//  Copyright (c) 2015년 이대복. All rights reserved.
//

#import "ViewController.h"
#import "ExpandingCell.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    selectedIndex = -1;
    
    titleArray = [[NSMutableArray alloc] init];
    NSString *string;
    
    for(int ii=1; ii<=10; ii++){
        string = [[NSString alloc] initWithFormat:@"Row %i",ii];
        
        [titleArray addObject:string];
    }
    
    subtitleArray = [[NSArray alloc]initWithObjects:@"row1", @"row2", @"row3", @"row4", @"row5", @"row6", @"row7", @"row8", @"row9", @"row10", nil];
    textarray = [[NSArray alloc] initWithObjects:@"text1",@"text2",@"text3",@"text4",@"text5",@"text6",@"text7",@"text8",@"text9",@"text10", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return titleArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"expandingCell";
    
    ExpandingCell *cell = (ExpandingCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ExpandingCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    if(selectedIndex == indexPath.row){
        //expand
        cell.textLabel.hidden=NO;
        cell.fruitLabel.hidden=NO;
        cell.calculationLabel.hidden = NO;
        cell.calcLabel.hidden = NO;
    }else{
        //close
        cell.textLabel.hidden=YES;
        cell.fruitLabel.hidden=YES;
        cell.calculationLabel.hidden = YES;
        cell.calcLabel.hidden = YES;
    }
    
    cell.titleLabel.text = [titleArray objectAtIndex:indexPath.row];
    cell.subtitleLabel.text = [subtitleArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [textarray objectAtIndex:indexPath.row];
    int calculation = (indexPath.row + 1) * 25;
    cell.calculationLabel.text = [NSString stringWithFormat:@"%i",calculation];
    
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(selectedIndex == indexPath.row){
        //expand
        return 100;
    }else{
        //close
        return 44;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(selectedIndex == indexPath.row){
        selectedIndex = -1;
        [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        return;
    }
    
    if(selectedIndex != -1){
        NSIndexPath *prevPath = [NSIndexPath indexPathForItem:indexPath inSection:0];
        selectedIndex = indexPath.row;
        [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:prevPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    
    selectedIndex = indexPath.row;
    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
}
@end
