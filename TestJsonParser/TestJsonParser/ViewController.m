//
//  ViewController.m
//  TestJsonParser
//
//  Created by 이대복 on 2014. 12. 30..
//  Copyright (c) 2014년 이대복. All rights reserved.
//

#import "ViewController.h"
//https://github.com/johnezang/JSONKit
#import "JSONKit.h"

@interface ViewController ()

@end

@implementation ViewController

//convert jsonString to Array
- (NSDictionary *) converToArray:(NSString*)jsonStr{
    NSData *data = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    if(error){
        return nil;
    }
    return json;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //string data on received to server
    NSString *jsonStr1 = @"{    \"key1\": \"value1\",    \"key2\": \"value2\",    \"key3\": \"value3\",    \"key4\": \"value4\",    \"key5\": \"value5\",    \"key6\": \"value6\",	\"key7\": 777,	\"key8\": true,    \"key9\": false,\"list\":[    {        \"item1\":\"itemvalue11\",        \"item2\":\"itemvalue12\",        \"item3\":\"itemvalue13\",        \"item4\":\"itemvalue14\",    },    {        \"item1\":\"itemvalue21\",        \"item2\":\"itemvalue22\",        \"item3\":\"itemvalue23\",        \"item4\":\"itemvalue24\",    },    {        \"item1\":\"itemvalue31\",        \"item2\":\"itemvalue32\",        \"item3\":\"itemvalue33\",        \"item4\":\"itemvalue34\",    }    ],    \"data1\":    {        \"dataitem1\":\"dataitemvalue1\",        \"dataitem2\":\"dataitemvalue2\",        \"dataitem3\":\"dataitemvalue3\",        \"dataitem4\":\"dataitemvalue4\",    }}";
    
    NSDictionary *jsonDic = [self converToArray:jsonStr1];
    NSArray *keys = [jsonDic allKeys];
    
    for(NSString *key in keys){
        NSDictionary *latestLoans = [jsonDic objectForKey:[NSString stringWithFormat:@"%@",key]];
        //최상위 값일 경우
        NSString *a = [NSString stringWithFormat:@"%@",key];
        NSLog(@"key ==== %@",a);

        if(latestLoans==nil) {
            continue;
        }
        
        if([latestLoans isKindOfClass:[NSString class]]){
            // string
            NSString *b = [NSString stringWithFormat:@"%@",latestLoans];
            NSLog(@"NSString ==== %@",b);
        }else if([latestLoans isKindOfClass:[NSArray class]]){
            // list
            for(NSArray *tmpArr in latestLoans){
                NSString *item = [NSString stringWithFormat:[tmpArr valueForKey:@"item1"]];
                NSLog(@"NSArray item1 ==== %@",item);
            }
        }else if([latestLoans isKindOfClass:[NSNumber class]]){
            // number(int long double...) and boolean
            NSString *b = [NSString stringWithFormat:@"%@",latestLoans];
            NSLog(@"NSNumber ==== %@",b);
        }else if([latestLoans isKindOfClass:[NSDictionary class]]){
            // { key:value, key:value }
            NSArray *dicKeys = [latestLoans allKeys];
            for(NSString *dicKey in dicKeys){
                NSString *subValue = [NSString stringWithFormat:@"%@",[latestLoans objectForKey:[NSString stringWithFormat:@"%@",dicKey]]];
                NSLog(@"NSDictionary key ==== %@ / value ==== %@",dicKey, subValue);
            }
        }else if([latestLoans isKindOfClass:[NSObject class]]){
            // ?
            NSString *b = [NSString stringWithFormat:@"%@",latestLoans];
            NSLog(@"NSObject ==== %@",b);
        }else{
            // etc
            NSString *b = [NSString stringWithFormat:@"%@",latestLoans];
            NSLog(@"else ==== %@",b);
        }
        
        NSLog(@"============================================================");
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
