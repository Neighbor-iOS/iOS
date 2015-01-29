//
//  CollectionViewController.m
//  CollectionTest
//
//  Created by 강민우 on 2015. 1. 20..
//  Copyright (c) 2015년 강민우. All rights reserved.
//

#import "CollectionViewController.h"
#import "DetailViewController.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnVidkdnfewWillAppear = NO;
    
    // Do any additional setup after loading the view.
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    bool activateState = [[NSUserDefaults standardUserDefaults] boolForKey:@"ActivateState"];
    //_storedImages = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"CellImages"]];
    
    NSDictionary *imageDictionary = [self indexKeyedDictionaryFromArray:[self getFileNameByExtension:@"jpg"]];
    
    _storedImages = [self makeImageArrayFromDictionary:imageDictionary];
    
    if (activateState && [_storedImages count] == 0) {
        _cellImages = [[NSMutableArray alloc] initWithArray:[self getFileNameByExtension:@"jpg"]];
    } else {
        _cellImages = _storedImages;
    }
    
    // Register cell classes
    //[self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)getFileNameByExtension:(NSString *)extension {
    NSString *path = [[NSBundle mainBundle] resourcePath];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = [[NSError alloc] init];
    NSArray *directoryAndFileNames = [fileManager contentsOfDirectoryAtPath:path error:&error];
    NSString *format = [NSString stringWithFormat:@"self ENDSWITH '.%@'", extension];
    NSPredicate *filter = [NSPredicate predicateWithFormat:format];
    
    NSArray *filesNameArray = [directoryAndFileNames filteredArrayUsingPredicate:filter];
    
    return filesNameArray;
}

- (NSDictionary *)indexKeyedDictionaryFromArray:(NSArray *)array {
    id objectinstance;
    NSUInteger indexKey = 0;
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] init];
    
    for (objectinstance in array) {
        [mutableDictionary setObject:objectinstance forKey:[NSNumber numberWithUnsignedInt:indexKey++]];
    }
    
    return (NSDictionary *)mutableDictionary;
}

- (NSMutableArray *)makeImageArrayFromDictionary:(NSDictionary *)imageDictionary {
    NSString *imageName;
    NSMutableArray *result = [[NSMutableArray alloc] init];
    NSInteger indexKey = 0;
    
    for (imageName in imageDictionary) {
        imageName = [imageDictionary objectForKey:[NSNumber numberWithUnsignedInt:indexKey++]];
        [result addObject:imageName];
    }
    
    return result;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _cellImages.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    UIImage* image;
    int row = (int)[indexPath row];
    
    image = [UIImage imageNamed:_cellImages[row]];
    
    cell.imageView.image = image;
    
    return cell;
}

NSArray *deletions;

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    /*deletions = @[indexPath];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Delete Item" message:@"Do you want to delete the item?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    [alert setTag:1004];
    [alert show];*/
    
    NSString *sendImage = [_cellImages objectAtIndex:indexPath.item];
    DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    detailViewController.receivedImage = sendImage;
    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if ([alertView tag] == 1004) {
        switch (buttonIndex) {
            case 0:
                break;
            case 1:
            {
                int row = (int)[deletions[0] row];
                
                [_cellImages removeObjectAtIndex:row];
                
                [self.collectionView deleteItemsAtIndexPaths:deletions];
                
                [[NSUserDefaults standardUserDefaults] setObject:_cellImages forKey:@"CellImages"];
            }
                break;
                
            default:
                break;
        }
    }
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

#pragma mark Button Action

- (NSInteger)randIndex {
    int index = arc4random() % 12;
    
    return index;
}

- (IBAction)onAdd:(id)sender {
    /*int index = (int)[self randIndex];
    NSString *imageName = [[NSString alloc] initWithFormat:@"girl%02i.jpeg", index];
    //UIImage *girlImg = [UIImage imageNamed:imageName];
    [_cellImages addObject:imageName];
    
    [[NSUserDefaults standardUserDefaults] setObject:_cellImages forKey:@"CellImages"];    
    
    NSIndexPath* indexPath = [NSIndexPath indexPathForItem:[_cellImages count] - 1 inSection:0];
    [self.collectionView insertItemsAtIndexPaths:@[indexPath]];*/
}

@end
