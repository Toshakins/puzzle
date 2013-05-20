//
//  ViewController.m
//  puzzle
//
//  Created by Smartbit user on 5/14/13.
//  Copyright (c) 2013 Smartbit user. All rights reserved.
//

#import "ViewController.h"
#include <stdlib.h>

@interface ViewController ()

@end

@implementation ViewController

const int   rowTiles = 3,
            colTiles = 3,
            tileSize = 75;

ActiveButtons activeButtons;

- (void) permutateImages {
    NSMutableArray* tiles =[[NSMutableArray alloc] init];
    for (UIButton *btn in self.imageView.subviews) {
        [tiles addObject: btn.currentBackgroundImage];

    }
    int position;
    UIImage* t;
    for (UIButton* btn in self.imageView.subviews) {
        position = arc4random() % tiles.count;
        if (tiles.count > 0) {
            t = tiles[position];
            [btn setBackgroundImage:t forState:UIControlStateNormal];
            btn.tag = position;
            [tiles removeObjectAtIndex:position];
        }
    }
//    [a setBackgroundImage: b.currentBackgroundImage forState:UIControlStateNormal];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.image = [UIImage imageNamed:@"forest.png"];
    NSMutableArray* tiles = [self splitInTiles:self.image];
    int i = 0;
    for (UIButton *btn in self.imageView.subviews) {
        btn.tag = i;
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

- (IBAction)tileSelected:(id)sender {
}
@end
