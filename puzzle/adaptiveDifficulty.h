//
//  adaptiveDifficulty.h
//  puzzle
//
//  Created by Smartbit user on 5/27/13.
//  Copyright (c) 2013 Smartbit user. All rights reserved.
//

#ifndef puzzle_adaptiveDifficulty_h
#define puzzle_adaptiveDifficulty_h

NSInteger adapt(NSInteger byDefault, NSInteger took) {
    return (byDefault == took) ? byDefault + 5 : took - 5;
}

#endif
