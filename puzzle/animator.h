//
//  animator.h
//  puzzle
//
//  Created by Smartbit user on 5/28/13.
//  Copyright (c) 2013 Smartbit user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface animator : NSObject
+ (void) tap: (UIButton*) view also: (UIButton*) partner;
@end