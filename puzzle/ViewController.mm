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
    if (a.tag == 0 || b.tag == 0) {
        printf("NOW WILL BE ERROR\n");
        NSLog(@"img data: %@\n", (a.tag == 0) ? a.img : b.img);
    }
    [second setBackgroundImage:a.img forState:UIControlStateNormal];
    second.tag = a.tag;
    [first setBackgroundImage:b.img forState:UIControlStateNormal];
    first.tag = b.tag;
}

- (IBAction)tileSelected:(id)sender {
    UIButton* btn = sender;
    printf("Tile Event called\n");
    printf("on tile with tag: %d\n", btn.tag);
    ImageTag tmp = {btn.currentBackgroundImage, btn.tag};
    activeButtons.push(tmp);
    printf("This tags in activeButtons: %d %d\n", activeButtons.front().tag, activeButtons.back().tag);
    if (activeButtons.count() == 2) {
        printf("Call swapButtons...\n");
        [self swapButtons: activeButtons.front() withBitton:activeButtons.back()];
        activeButtons.clear();
    }
}
@end
