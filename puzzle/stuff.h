//
//  stuff.h
//  puzzle
//
//  Created by Smartbit user on 5/27/13.
//  Copyright (c) 2013 Smartbit user. All rights reserved.
//

#ifndef puzzle_adaptiveDifficulty_h
#define puzzle_adaptiveDifficulty_h

//here I store bunch of useful functions

#import <CommonCrypto/CommonDigest.h>


NSInteger adapt(NSInteger byDefault, NSInteger took) {
    return (byDefault == took) ? byDefault + 5 : took - 5;
}


NSString *sha(NSData *data) {
    unsigned char hash[CC_SHA512_DIGEST_LENGTH];
    if ( CC_SHA512([data bytes], [data length], hash) ) {
        NSMutableString* sha512 = [[NSMutableString alloc] init];
        for (int i = 0 ; i < CC_SHA512_DIGEST_LENGTH ; ++i)
        {
            [sha512 appendFormat: @"%02x", hash[i]];
        }
            NSLog(@"HASHED: %@", sha512);
        return sha512;
    }
    return nil;
}
#endif
