//
//  activeButtons.h
//  puzzle
//
//  Created by Smartbit user on 5/17/13.
//  Copyright (c) 2013 Smartbit user. All rights reserved.
//

#ifndef __puzzle__activeButtons__
#define __puzzle__activeButtons__

#include <iostream>
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <queue>

using namespace std;

class ActiveButtons {
    std::queue<UIButton*> active;
public:
    void pop();
    void push(UIButton* data);
    UIButton* front();
    UIButton* back();
};

#endif /* defined(__puzzle__activeButtons__) */
