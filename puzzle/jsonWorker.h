//
//  jsonWorker.h
//  puzzle
//
//  Created by Smartbit user on 5/30/13.
//  Copyright (c) 2013 Smartbit user. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONWorker : NSObject

+ (float) getTime: (NSString*) key;
+ (void) set: (NSString*) key withTime:(float) time;

@end
