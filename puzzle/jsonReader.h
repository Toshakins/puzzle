//
//  jsonReader.h
//  puzzle
//
//  Created by Smartbit user on 5/27/13.
//  Copyright (c) 2013 Smartbit user. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface jsonReader : NSObject
+ (NSDictionary*) read:(NSData*) json;
+ (void) add: (NSString*) key  propeValue:(NSString*) value;
- (void) save: (NSDictionary*) json;
@end
