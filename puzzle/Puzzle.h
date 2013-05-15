//
//  Puzzle.h
//  puzzle
//
//  Created by Smartbit user on 5/15/13.
//  Copyright (c) 2013 Smartbit user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Puzzle : NSObject

-(int*) swapTiles;
-(void) splitInTiles:(UIImage*)img:(int)n;
@end
