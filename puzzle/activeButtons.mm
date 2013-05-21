//
//  activeButtons.cpp
//  puzzle
//
//  Created by Smartbit user on 5/17/13.
//  Copyright (c) 2013 Smartbit user. All rights reserved.
//

#import "ActiveButtons.h"

void ActiveButtons::pop() {
    active.pop();
}

void ActiveButtons::push(ImageTag data) {
    //dumb clause, but what I can do?
    if (active.size() == 2) {
        active.pop();
    }
    active.push(data);
}

ImageTag ActiveButtons::front() {
    return active.front();
}

ImageTag ActiveButtons::back() {
    return active.back();
}

void ActiveButtons::clear() {
    while (!active.empty()) {
        active.pop();
    }
}

int ActiveButtons::count() {
    return active.size();
}