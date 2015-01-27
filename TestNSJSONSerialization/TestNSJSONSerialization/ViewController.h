//
//  ViewController.h
//  TestNSJSONSerialization
//
//  Created by 이대복 on 2014. 12. 31..
//  Copyright (c) 2014년 이대복. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WDActivityIndicator.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    @private
    IBOutlet UITableView    *tvTrends;
    NSArray                 *trends;
}
@property (weak, nonatomic) IBOutlet WDActivityIndicator *activityIndicator;


@end

