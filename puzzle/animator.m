//
//  animator.m
//  puzzle
//
//  Created by Smartbit user on 5/28/13.
//  Copyright (c) 2013 Smartbit user. All rights reserved.
//

#import "animator.h"

@implementation animator

+ (CATransform3D) rotateY:(float)angle {
    CATransform3D r = CATransform3DIdentity;
    float rad = angle * M_PI / 180.0f;
    r.m11 = cosf(rad);
    r.m13 = -sinf(rad);
    r.m31 = sinf(rad);
    r.m33 = cosf(rad);
    return r;
}

+ (void) untap:(UIButton*) view also: (UIButton*) partner {
    [UIView animateWithDuration:0.25 animations:^{
        view.layer.transform = [self rotateY:180.0f];
        partner.layer.transform = [self rotateY:180.0f];
    }];
}

+ (void) tap: (UIButton*) view also:(UIButton *)partner {
    [UIView animateWithDuration:0.25 animations:^{
            view.layer.transform = [self rotateY:90.0f];
            partner.layer.transform = [self rotateY:90.0f];
        }
        completion:^(BOOL finished){
            //swap
            UIButton* t = [[UIButton alloc] init];
            [t setBackgroundImage:view.currentBackgroundImage forState:UIControlStateNormal];
            t.tag = view.tag;
            [view setBackgroundImage:partner.currentBackgroundImage forState:UIControlStateNormal];
            view.tag = partner.tag;
            [partner setBackgroundImage:t.currentBackgroundImage forState:UIControlStateNormal];
            partner.tag = t.tag;
            [self untap:view also: partner];
        }
    ];

}
@end
