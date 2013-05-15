//
//  ViewController.m
//  puzzle
//
//  Created by Smartbit user on 5/14/13.
//  Copyright (c) 2013 Smartbit user. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

const int   rowTiles = 3,
            colTiles = 3,
            tileSize = 75;

UIImage*    Tiles[rowTiles][colTiles];


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.image = [UIImage imageNamed:@"forest.jpg"];
    [self splitInTiles:self.image];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pickBtn:(id)sender {
    
}

-(void) splitInTiles:(UIImage*) img{
    CGImageRef CGTile;
    CGFloat x, y;
    for (int row = 0; row < rowTiles; ++row) {
        y = row * tileSize;
        for (int col = 0; col < colTiles; ++col) {
            x = col * tileSize;
            CGTile = CGImageCreateWithImageInRect(img.CGImage, CGRectMake(x, y, tileSize, tileSize));
            Tiles[row][col] = [UIImage imageWithCGImage:CGTile];
            
        }
    }
}

@end
