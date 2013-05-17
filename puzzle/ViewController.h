//
//  ViewController.h
//  puzzle
//
//  Created by Smartbit user on 5/14/13.
//  Copyright (c) 2013 Smartbit user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Puzzle.h"
#import "activeButtons.h"

@interface ViewController : UIViewController
- (IBAction)pickBtn:(id)sender;
-(NSMutableArray*) splitInTiles:(UIImage*) img;
- (IBAction)tileSelected:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) UIImage *image;
@property (weak, nonatomic) IBOutlet UIView *imageView;

@end
