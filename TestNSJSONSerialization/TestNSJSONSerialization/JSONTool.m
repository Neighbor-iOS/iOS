//
//  JSONTool.m
//  TestNSJSONSerialization
//
//  Created by 이대복 on 2015. 1. 12..
//  Copyright (c) 2015년 이대복. All rights reserved.
//

#import "JSONTool.h"


@implementation JSONTool

- (NSArray*)convertNSDataToNSArray:(NSData*)data withkey:(NSString*)key{
    NSLog(@"convertNSDataToNSArray---------%@",data);
    
    NSError *error;
    //NSData에 담겨온 결과값 JSON형태로 해석
    NSArray *json = [NSJSONSerialization JSONObjectWithData:data
                                                    options:kNilOptions
                                                      error:&error];
    NSLog(@"convertNSDataToNSArray---------json-----%@",json);
    
    //JSON 해석시 에러가 발생하면 얼럿뷰 팝업
    if(error){
//        UIAlertView *alertError = [[UIAlertView alloc] initWithTitle:@"ERROR1" message:[NSString stringWithFormat:@"%@", error] delegate:self cancelButtonTitle:@"확인" otherButtonTitles:nil, nil];
//        [alertError show];
        return nil;
    }
    return [[json objectAtIndex:0] objectForKey:key];
}

@end
