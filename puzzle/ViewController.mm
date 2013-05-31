//
//  ViewController.m
//  puzzle
//
//  Created by Smartbit user on 5/14/13.
//  Copyright (c) 2013 Smartbit user. All rights reserved.
//

#import "ViewController.h"
#import "stuff.h"
#import "consts.h"
#import "animator.h"
#import "ViewController_pickerDelegate.h"
#import <stdlib.h>
#import <vector>
#import <AudioToolbox/AudioServices.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

//residence of side effects
const int   rowTiles = 4,
            colTiles = 4,
            tileSize = 50;
NSDate* startTime;
float countdownSeconds = 30;
NSString* timerFormat = @"0:%.0f";
NSString* imgHash;
bool firstRun = false;

ActiveButtons activeButtons;

@synthesize addPic, topLabel, image, imageView, timer;


- (UIImage*)resizeImage:(UIImage*)img
              scaledToSize:(CGSize)newSize;
{
    UIGraphicsBeginImageContext( newSize );
    [img drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

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

- (void) arrangeView
{
    NSMutableArray* tiles = [self splitInTiles:self.image];
    int i = 0;
    for (UIButton *btn in self.imageView.subviews) {
        btn.tag = i + 1;
        [btn setBackgroundImage:[tiles objectAtIndex:i] forState:UIControlStateNormal];
        btn.frame = CGRectMake(i / colTiles * tileSize, i % colTiles * tileSize, tileSize, tileSize);
        ++i;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSUserDefaults* config;
    config = [NSUserDefaults standardUserDefaults];
    //check if "last" key exists
    NSMutableDictionary* last = [[config dictionaryForKey:@"last"] mutableCopy];
    if (last) {
        self.image = [UIImage imageWithData:[last valueForKey:@"image"]];
        countdownSeconds = [[last valueForKey:@"time"] floatValue];
    }
    else {
        self.image = [UIImage imageNamed:@"last.png"];
        last = [[NSMutableDictionary alloc] init];
        [last setValue:UIImagePNGRepresentation(self.image) forKey:@"image"];
        [last setValue:[NSNumber numberWithFloat:45] forKey:@"time"];
        [config setValue:last forKey:@"last"];
    }
    [addPic setBackgroundImage:[UIImage imageNamed:@"addPic.png"] forState:UIControlStateNormal];
    [self arrangeView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pickBtn:(id)sender {
    [self permutateImages];
    timerFormat = @"0:%.0f";
    self.timer.textColor = [UIColor greenColor];
    startTime = [NSDate date];
    self.timer.text = [NSString stringWithFormat:timerFormat, countdownSeconds];
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self
             selector:@selector (countdownUpdateMethod:) userInfo:nil repeats:YES];
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
    UIButton* first = (UIButton*) [self.imageView viewWithTag: a.tag];
    UIButton* second = (UIButton*) [self.imageView viewWithTag: b.tag];
    
    //stunts
    [animator tap:first also:second];    
}

- (IBAction)tileSelected:(id)sender {
    //TODO: maybe highlight selected tiles is a good idea
    UIButton* btn = sender;
    ImageTag tmp = {btn.currentBackgroundImage, btn.tag};
    activeButtons.push(tmp);
    if (activeButtons.full()) {
        [self swapButtons: activeButtons.front() withBitton:activeButtons.back()];
        activeButtons.clear();
    }
    //TODO: scoreboard
}

- (IBAction)addPic:(id)sender {
    [self startMediaBrowserFromViewController: self
                                usingDelegate: self];
}

- (void)countdownUpdateMethod:(NSTimer*)theTimer {
    NSDate *currentDate = [NSDate date];
    NSTimeInterval elapsedTime = [currentDate timeIntervalSinceDate:startTime];
    
    NSTimeInterval difference = countdownSeconds - elapsedTime;
    if (difference <= 0) {
        [theTimer invalidate];
        difference = 0;
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@":-("
                                                        message:@"You didn't get in time. Try once more!"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        alert.tag = FAIL;
        [alert show];
        //TODO: restart on OK

    }
    if (difference < 5) {
        //TODO: call next two lines only once
        timerFormat = @"%.1f";
        self.timer.textColor = [UIColor colorWithRed:210/255.0f green:45/255.0f blue:60/255.0f alpha:1.0f];
        //crap. It didn't work in simulator
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    }
    self.timer.text = [NSString stringWithFormat:timerFormat, difference];
}
@end
