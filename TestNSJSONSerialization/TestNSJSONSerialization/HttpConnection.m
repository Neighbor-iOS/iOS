//
//  HttpConnection.m
//  TestNSJSONSerialization
//
//  Created by 이대복 on 2015. 1. 9..
//  Copyright (c) 2015년 이대복. All rights reserved.
//

#import "HttpConnection.h"
#import "ViewController.h"

@implementation HttpConnection

- (NSURLConnection*)setHttpConn:(NSString*)url :(NSString*)params {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    
    //set http methode & add params
//    [request setHTTPMethod:@"GET"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    //통신을 시도하고 결과값을 가져올 Connection객체 생성
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    return conn;
}
@end
