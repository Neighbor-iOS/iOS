//
//  HttpConnection.h
//  TestNSJSONSerialization
//
//  Created by 이대복 on 2015. 1. 9..
//  Copyright (c) 2015년 이대복. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpConnection : NSURLConnection
- (NSURLConnection*)setHttpConn:(NSString*)url :(NSString*)params;
@end
