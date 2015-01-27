//
//  ViewController.m
//  TestNSJSONSerialization
//
//  Created by 이대복 on 2014. 12. 31..
//  Copyright (c) 2014년 이대복. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"
#import "NextViewController.h"

#import "JSONKit.h"

#import "JSONTool.h"

#define VERSION9 1
#define PIE 3.141592

@interface ViewController()

@end


@implementation ViewController


- (void)viewDidLoad {
    NSLog(@"%@---------",@"viewDidLoad");
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    tvTrends.dataSource = self;
    tvTrends.delegate = self;
    
    //스테이터스바의 스피너 추가
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    
    /**
    * Roading Dialog Library
    * 라이브러리를 분석해본 결과 이미지를 원하는 것으로 변경 가능
    */
    [self.activityIndicator setIndicatorStyle:WDActivityIndicatorStyleSegmentLarge];
    //animation start
    [self.activityIndicator startAnimating];
    
    NSString *jsonUrl = @"http://bokgoon.zc.bz/testJsonData2.json";
    NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL URLWithString:jsonUrl]];
    NSLog(@"jsonData ============= %@",jsonData);
    
    trends = nil;
    
    JSONTool *tool = [[JSONTool alloc]init];
    trends = [tool convertNSDataToNSArray:jsonData withkey:@"trends"];
    
    
    if(trends==nil) {
        // json convert error
    }else{
        //이상없이 해석이 완료되면 테이블뷰 리로드
        [tvTrends reloadData];
    }


    //스테이터스바의 스피너 제거
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    //animation stop
    [self.activityIndicator stopAnimating];
#if 0
    //스테이터스바에 스피너 추가
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    /**
     * Roading Dialog Library
     * 라이브러리를 분석해본 결과 이미지를 원하는 것으로 변경 가능
     */    [self.activityIndicator setIndicatorStyle:WDActivityIndicatorStyleSegmentLarge];
    self.activityIndicator.hidesWhenStopped = YES;
    //animation start
    [self.activityIndicator startAnimating];
    
    //set url for call
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://bokgoon.zc.bz/testJsonData2.json"]];
    
    //set url params
//    NSString *params = [[NSString alloc] initWithFormat:@"foo=bar&key=value"];
    
    //set http methode & add params
    [request setHTTPMethod:@"GET"];
//    [request setHTTPMethod:@"POST"];
//    [request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    //통신을 시도하고 결과값을 가져올 Connection객체 생성
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    //connection 시작
    [connection start];
    NSLog(@"connection start!!!!!!");
#endif
}

- (void)didReceiveMemoryWarning {
    NSLog(@"%@---------",@"didReceiveMemoryWarning");
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//// connection error
//- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
//{
//    NSLog(@"%@---------%@",@"didFailWithError",error);
//    //통신에러 발생시 에러메시지를 포함한 얼럿뷰 팝업
//    UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"ERROR" message:[NSString stringWithFormat:@"%@", error] delegate:self cancelButtonTitle:@"확인" otherButtonTitles:nil, nil];
//    [errorAlert show];
//    
//    //스테이터스바의 스피너 제거
//    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
//    //animation stop
//    [self.activityIndicator stopAnimating];
//}
//
////get hearder data
//- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)aResponse
//{
//    //didReceiveResponse
//    NSLog(@"%@---------%@",@"didReceiveResponse",aResponse);
//}
//
////get respons data
//- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
//{
//    NSLog(@"%@---------%@",@"didReceiveData", data);
//    dispatch_async(
//                   dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
//                   ^{
//                       //결과값을 해석할 메소드 호출 with thread
//                       [self performSelectorOnMainThread:@selector(_fetchedData:) withObject:data waitUntilDone:YES];
//                   }
//                   );
//}

//- (NSArray*)convertNSDataToNSArray:(NSData*)data withkey:(NSString*)key{
//    NSLog(@"convertNSDataToNSArray---------%@",data);
//    
//    NSError *error;
//    //NSData에 담겨온 결과값 JSON형태로 해석
//    NSArray *json = [NSJSONSerialization JSONObjectWithData:data
//                                                    options:kNilOptions
//                                                      error:&error];
//    NSLog(@"convertNSDataToNSArray---------json-----%@",json);
//    
//    //JSON 해석시 에러가 발생하면 얼럿뷰 팝업
//    if(error){
//        UIAlertView *alertError = [[UIAlertView alloc] initWithTitle:@"ERROR1" message:[NSString stringWithFormat:@"%@", error] delegate:self cancelButtonTitle:@"확인" otherButtonTitles:nil, nil];
//        [alertError show];
//        return nil;
//    }
//    return [[json objectAtIndex:0] objectForKey:key];
//}
//JSON데이터를 해석하는 메소드
//- (void)_fetchedData:(NSData *)responseData
//{
//    
//    trends = nil;
////    trends = [self convertNSDataToNSArray:responseData withkey:@"trends"];
//    JSONTool *tool = [[JSONTool alloc]init];
//    trends = [tool convertNSDataToNSArray:responseData withkey:@"trends"];
//    
////    NSLog(@"******************* %@",[self convertNSDataToNSArray:responseData withkey:@"trends"]);
//    
//    if(trends==nil) {
//        // json convert error
//    }else{
//        //이상없이 해석이 완료되면 테이블뷰 리로드
//        [tvTrends reloadData];
//    }
//    
//    //스테이터스바의 스피너 제거
//    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
//    
//    //animation stop
//    [self.activityIndicator stopAnimating];
//}

//list count
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"numberOfRowsInSection----%lu",(unsigned long)[trends count]);
    
    return [trends count];
}

//item height
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

//item getview
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TrendCellIdentifier";
    
    //custom item 2
    CustomTableViewCell *cell = (CustomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell==nil){
        [tableView registerNib:[UINib nibWithNibName:@"CustomTableViewCell" bundle:nil] forCellReuseIdentifier:CellIdentifier];
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    }
    cell.customLabelName.text = [[trends objectAtIndex:indexPath.row] objectForKey:@"name"];
    cell.customLabelUrl.text = [[trends objectAtIndex:indexPath.row] objectForKey:@"url"];
    cell.customLabelPhone.text = [[trends objectAtIndex:indexPath.row] objectForKey:@"phone"];
    cell.customLabelEmail.text = [[trends objectAtIndex:indexPath.row] objectForKey:@"email"];
    cell.customProgress.progress = [indexPath row] * 0.1;

    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *imgUrl = [[trends objectAtIndex:indexPath.row] objectForKey:@"imgurl"];
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imgUrl]];
        cell.customImg.image = [UIImage imageWithData:imageData];
    });
    
    //custom item 1
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    UILabel *text1 = nil;
//    UILabel *text2 = nil;
//    UILabel *text3 = nil;
//    UILabel *text4 = nil;
//    UILabel *text5 = nil;
//    
//    if(cell == nil)
//    {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
//        
//        text1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 50, 50)];
//        text2 = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, 50, 50)];
//        text3 = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, 80, 50)];
//        text4 = [[UILabel alloc] initWithFrame:CGRectMake(180, 0, 80, 50)];
//        text5 = [[UILabel alloc] initWithFrame:CGRectMake(260, 0, 80, 50)];
//        text1.tag = 100;
//        text2.tag = 200;
//        text3.tag = 300;
//        text4.tag = 400;
//        text5.tag = 500;
//        [cell.contentView addSubview:text1];
//        [cell.contentView addSubview:text2];
//        [cell.contentView addSubview:text3];
//        [cell.contentView addSubview:text4];
//        [cell.contentView addSubview:text5];
//    }else{
//        text1 = [cell.contentView viewWithTag:100];
//        text2 = [cell.contentView viewWithTag:200];
//        text3 = [cell.contentView viewWithTag:300];
//        text4 = [cell.contentView viewWithTag:400];
//        text5 = [cell.contentView viewWithTag:500];
//    }
//    NSLog(@"cell2 =======%@",cell);
//    text1.text = [[trends objectAtIndex:indexPath.row] objectForKey:@"name"];
//    text2.text = [[trends objectAtIndex:indexPath.row] objectForKey:@"url"];
//    text3.text = [[trends objectAtIndex:indexPath.row] objectForKey:@"phone"];
//    text4.text = [[trends objectAtIndex:indexPath.row] objectForKey:@"birth"];
//    text5.text = [[trends objectAtIndex:indexPath.row] objectForKey:@"email"];
    
    //base item
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if(cell == nil)
//    {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] ;
//    }
//    cell.textLabel.text=[[trends objectAtIndex:indexPath.row] objectForKey:@"name"];
//    cell.detailTextLabel.text=[[trends objectAtIndex:indexPath.row] objectForKey:@"url"];
    
    return cell;
}


// item onclick
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *msg = [NSString stringWithFormat:@"item click row is %ld\nname = %@", (long)indexPath.row, [[trends objectAtIndex:indexPath.row] objectForKey:@"name"]];
    
    UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"click" message:msg delegate:self cancelButtonTitle:@"확인" otherButtonTitles:@"취소", nil];
    [errorAlert show];
}

//alert onclick
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{    
    NSLog(@"title = %@\nindex = %ld",[alertView title], (long)buttonIndex);
    //onclick in alert button
    if ( [[alertView title] isEqualToString:@"click"])
    {
        if(buttonIndex==0){
            //left(cancel)
            NextViewController *next = [[NextViewController alloc]init];
            [self presentViewController:next animated:YES completion:^(){
                NSLog(@"Call NextViewController");
            }];
        }else {
            //right(other)
        }
    }
}

@end
