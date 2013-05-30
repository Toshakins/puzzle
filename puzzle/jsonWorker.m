//
//  jsonWorker.m
//  puzzle
//
//  Created by Smartbit user on 5/30/13.
//  Copyright (c) 2013 Smartbit user. All rights reserved.
//

#import "jsonWorker.h"

@implementation JSONWorker

NSString* const config = @"config.json";
NSString* pathToConfig;
NSMutableDictionary* json;

- (id) init {
    self = [super init];
    if (self) {
        NSError* error;
        pathToConfig = [[NSBundle mainBundle]
                       pathForResource: [config stringByDeletingPathExtension]
                       ofType:[config pathExtension]];
        json = [NSJSONSerialization JSONObjectWithData:[NSData
                dataWithContentsOfFile: pathToConfig]
                options:kNilOptions error:&error];
    }
    return self;
}

+ (float) getTime: (NSString*) key {
    NSDictionary* object = [json valueForKey:key];
    return [[object valueForKey:@"time"] floatValue];
}

+ (void) set: (NSString*) key withTime:(float) time {
    //FIXME: I think it's very ugly. Maybe better way exists.
//    NSMutableDictionary* object = [json valueForKey:key];
    NSMutableDictionary* object = [[NSMutableDictionary alloc] init];
    [object setObject:[NSNumber numberWithFloat:time] forKey:@"time"];
    //BUG: it crashes with "mutating method sent to immutable object"
    [json setObject:object forKey:key];
    NSError* error;
    if(![NSJSONSerialization writeJSONObject:json toStream:[NSOutputStream outputStreamToFileAtPath:pathToConfig append:NO] options:0 error:&error])
        NSLog(@"COOL");
    else
        NSLog(@"WRONG");
}

@end
