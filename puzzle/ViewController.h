//
//  ViewController.h
//  puzzle
//
//  Created by Smartbit user on 5/14/13.
//  Copyright (c) 2013 Smartbit user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Puzzle.h"
#import "dataTypes.h"
#import "activeButtons.h"

//http://mobile.tutsplus.com/tutorials/iphone/uialertview/
@interface ViewController : UIViewController <UIAlertViewDelegate>
- (IBAction) pickBtn:(id)sender;
- (NSMutableArray*) splitInTiles:(UIImage*) img;
- (IBAction) tileSelected:(id)sender;
- (void) permutateImages;
- (void) swapButtons:(ImageTag) a withBitton:(ImageTag) b;
- (bool) isSolved;
- (IBAction)addPic:(id)sender;
- (void) arrangeView;
- (UIImage*)resizeImage:(UIImage*)image
              scaledToSize:(CGSize)newSize;

@property (weak, nonatomic) IBOutlet UIButton *addPic;
@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UIView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *timer;
@property (weak, nonatomic) UIImage *image;

@end