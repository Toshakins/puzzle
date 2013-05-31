//
//  ViewController_UIAlertViewDelegate.h
//  puzzle
//
//  Created by Smartbit user on 5/31/13.
//  Copyright (c) 2013 Smartbit user. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIAlertViewDelegate>
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
@end

@implementation ViewController ()

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSUserDefaults* config;
    
    if (alertView.tag == FAIL) {
        //increase time and save to @hash and @last
    }
    if (alertView.tag == WIN) {
        //decrease time and save
        
    }
}

@end