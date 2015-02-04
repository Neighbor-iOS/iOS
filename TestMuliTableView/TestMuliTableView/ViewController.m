//
//  ViewController.m
//  TestMuliTableView
//
//  Created by bokgoon on 2015. 2. 3..
//  Copyright (c) 2015년 bokgoon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _list1.dataSource = self;
    _list1.delegate = self;
    
    _list2.dataSource = self;
    _list2.delegate = self;
    
    _list3.dataSource = self;
    _list3.delegate = self;

    
    item1 = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"];
    item2 = @[@"11",@"22",@"33",@"44",@"55",@"66",@"77",@"88",@"99",@"100",@"11",@"22",@"33",@"44",@"55",@"66",@"77",@"88",@"99",@"100"];
    item3 = @[@"111",@"222",@"333",@"444",@"555",@"666",@"777",@"888",@"999",@"1000",@"111",@"222",@"333",@"444",@"555",@"666",@"777",@"888",@"999",@"1000"];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (tableView.tag) {
        case 1:
            return item1.count;
        case 2:
            return item2.count;
        case 3:
            return item3.count;
        default:
            return 0;
    }
    return 0;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"CellIdentifier";
    
    //base item
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    }
    
    switch (tableView.tag) {
        case 1:
            cell.textLabel.text= [item1 objectAtIndex:indexPath.row];
            break;
        case 2:
            cell.textLabel.text= [item2 objectAtIndex:indexPath.row];
            break;
        case 3:
            cell.textLabel.text= [item3 objectAtIndex:indexPath.row];
            break;
        default:
            cell.textLabel.text= @"nil";
            break;
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
