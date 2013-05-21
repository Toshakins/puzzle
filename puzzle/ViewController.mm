//
//  ViewController.m
//  puzzle
//
//  Created by Smartbit user on 5/14/13.
//  Copyright (c) 2013 Smartbit user. All rights reserved.
//

#import "ViewController.h"
#import <stdlib.h>
#import <vector>

@interface ViewController ()

@end

@implementation ViewController

const int   rowTiles = 3,
            colTiles = 3,
            tileSize = 75;

ActiveButtons activeButtons;

- (void) permutateImages {
    NSMutableArray* tiles =[[NSMutableArray alloc] init];
    //hello, I can't dictionaries
    NSMutableArray* indexes = [[NSMutableArray alloc] init];
    for (UIButton *btn in self.imageView.subviews) {
        [tiles addObject: btn.currentBackgroundImage];
        [indexes addObject: [NSNumber numberWithInt:btn.tag]];

    }
    int position;
    UIImage* t;
    for (UIButton* btn in self.imageView.subviews) {
        position = arc4random() % tiles.count;
        if (tiles.count > 0) {
            t = tiles[position];
            [btn setBackgroundImage:t forState:UIControlStateNormal];
            btn.tag = [indexes[position] integerValue];
            [tiles removeObjectAtIndex:position];
            [indexes removeObjectAtIndex:position];
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.image = [UIImage imageNamed:@"forest.png"];
    NSMutableArray* tiles = [self splitInTiles:self.image];
    int i = 0;
    for (UIButton *btn in self.imageView.subviews) {
        btn.tag = i + 1;
        [btn setBackgroundImage:[tiles objectAtIndex:i] forState:UIControlStateNormal];
        btn.frame = CGRectMake(i / colTiles * tileSize, i % colTiles * tileSize, tileSize, tileSize);
        ++i;
    }
    [self permutateImages];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pickBtn:(id)sender {
    [self permutateImages];
}

-(NSMutableArray*) splitInTiles:(UIImage*) img{
    CGImageRef CGTile;
    CGFloat x, y;
    NSMutableArray* bloodyTiles;
    bloodyTiles = [NSMutableArray array];    for (int row = 0; row < rowTiles; ++row) {
        y = row * tileSize;
        for (int col = 0; col < colTiles; ++col) {
            x = col * tileSize;
            CGTile = CGImageCreateWithImageInRect(img.CGImage, CGRectMake(x, y, tileSize, tileSize));
            [bloodyTiles addObject: [UIImage imageWithCGImage:CGTile]];
        }
    }
    return bloodyTiles;
}

- (void) swapButtons: (ImageTag) a withBitton:(ImageTag) b {
    UIButton* first = (UIButton*)[self.imageView viewWithTag: a.tag];
    UIButton* second = (UIButton*) [self.imageView viewWithTag: b.tag];
    [second setBackgroundImage:a.img forState:UIControlStateNormal];
    second.tag = a.tag;
    [first setBackgroundImage:b.img forState:UIControlStateNormal];
    first.tag = b.tag;
}

- (IBAction)tileSelected:(id)sender {
    UIButton* btn = sender;
    ImageTag tmp = {btn.currentBackgroundImage, btn.tag};
    activeButtons.push(tmp);
    if (activeButtons.full()) {
        [self swapButtons: activeButtons.front() withBitton:activeButtons.back()];
        activeButtons.clear();
    }
    if ([self isSolved]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congatulations!"
                                                        message:@"You sucessfully solve puzzle."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
}

- (bool) isSolved {
    for (int i = 1; i < self.imageView.subviews.count; ++i) {
        if ( ((UIButton*) self.imageView.subviews[i]).tag - ((UIButton*) self.imageView.subviews[i - 1]).tag != 1) {
            return false;
        }
    }
    return true;
}
@end
