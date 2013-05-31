//
//  AlertViewHandler.h
//  puzzle
//
//  Created by Smartbit user on 5/31/13.
//  Copyright (c) 2013 Smartbit user. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlertViewHandler : NSObject <UIAlertViewDelegate>
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
@end
