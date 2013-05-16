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


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.image = [UIImage imageNamed:@"forest.png"];
    NSMutableArray* tiles = [self splitInTiles:self.image];
    for (UIButton *btn in self.imageView.subviews) {
        int i = 0;
        printf("Gotcha!\n");
        [btn setBackgroundImage:[tiles objectAtIndex:i] forState:UIControlStateNormal];
        btn.frame = CGRectMake(5, 5, 75, 75);
        //btn.frame = CGRectMake(i / colTiles * tileSize, i % colTiles * tileSize, tileSize, tileSize);
        ++i;
    }
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
    bloodyTiles = [bloodyTiles initWithCapacity:(colTiles * rowTiles)];
    for (int row = 0; row < rowTiles; ++row) {
        y = row * tileSize;
        for (int col = 0; col < colTiles; ++col) {
            x = col * tileSize;
            CGTile = CGImageCreateWithImageInRect(img.CGImage, CGRectMake(x, y, tileSize, tileSize));
            bloodyTiles[row * colTiles + col] = [UIImage imageWithCGImage:CGTile];
        }
    }
    return bloodyTiles;
}

- (IBAction)tileSelected:(id)sender {
}
@end
