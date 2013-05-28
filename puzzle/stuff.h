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


NSData *sha1(NSData *data) {
    unsigned char hash[CC_SHA256_DIGEST_LENGTH];
    if ( CC_SHA256([data bytes], [data length], hash) ) {
        NSData *sha1 = [NSData dataWithBytes:hash length:CC_SHA1_DIGEST_LENGTH];
        return sha1;
    }
    return nil;
}
#endif
