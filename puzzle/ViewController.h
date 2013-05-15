//
//  ViewController.h
//  puzzle
//
//  Created by Smartbit user on 5/14/13.
//  Copyright (c) 2013 Smartbit user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Puzzle.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *imageView;
- (IBAction)pickBtn:(id)sender;
-(void) splitInTiles:(UIImage*) img;
@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) UIImage *image;
@end
