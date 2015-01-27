//
//  JSONTool.h
//  TestNSJSONSerialization
//
//  Created by 이대복 on 2015. 1. 12..
//  Copyright (c) 2015년 이대복. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONTool : NSObject

- (NSArray*)convertNSDataToNSArray:(NSData*)data withkey:(NSString*)key;

@end
