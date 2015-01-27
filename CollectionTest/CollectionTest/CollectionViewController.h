//
//  CollectionViewController.h
//  CollectionTest
//
//  Created by 강민우 on 2015. 1. 20..
//  Copyright (c) 2015년 강민우. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewCell.h"

@interface CollectionViewController : UICollectionViewController<UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) NSMutableArray *cellImages;
@property (strong, nonatomic) NSMutableArray *storedImages;

- (IBAction)onAdd:(id)sender;
@end
