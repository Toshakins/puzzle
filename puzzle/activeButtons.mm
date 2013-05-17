//
//  activeButtons.cpp
//  puzzle
//
//  Created by Smartbit user on 5/17/13.
//  Copyright (c) 2013 Smartbit user. All rights reserved.
//

#include "ActiveButtons.h"

void ActiveButtons::pop() {
    active.pop();
}

void ActiveButtons::push(UIButton *data) {
    if (active.size() == 2) {
        active.pop();
    }
    active.push(data);
}

UIButton* ActiveButtons::front() {
    return active.front();
}

UIButton* ActiveButtons::back() {
    return active.back();
}