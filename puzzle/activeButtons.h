//
//  activeButtons.h
//  puzzle
//
//  Created by Smartbit user on 5/17/13.
//  Copyright (c) 2013 Smartbit user. All rights reserved.
//

#ifndef __puzzle__activeButtons__
#define __puzzle__activeButtons__

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <queue>
#import "dataTypes.h"

using namespace std;

class ActiveButtons {
    std::queue<ImageTag> active;
public:
    void pop();
    void push(ImageTag data);
    ImageTag front();
    ImageTag back();
    void clear();
    bool full();
};

#endif /* defined(__puzzle__activeButtons__) */
