//
//  ViewController_pickerDelegate.h
//  puzzle
//
//  Created by Smartbit user on 5/29/13.
//  Copyright (c) 2013 Smartbit user. All rights reserved.
//

#import "ViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController (ext) <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
- (BOOL) startMediaBrowserFromViewController: (UIViewController*) controller
                               usingDelegate: (id <UIImagePickerControllerDelegate,
                                               UINavigationControllerDelegate>) delegate;
- (void) imagePickerController: (UIImagePickerController *) picker
 didFinishPickingMediaWithInfo: (NSDictionary *) info;

@end

@implementation ViewController (ext)

- (BOOL) startMediaBrowserFromViewController: (UIViewController*) controller
                               usingDelegate: (id <UIImagePickerControllerDelegate,
                                               UINavigationControllerDelegate>) delegate {
    
    if (([UIImagePickerController isSourceTypeAvailable:
          UIImagePickerControllerSourceTypeSavedPhotosAlbum] == NO)
        || (delegate == nil)
        || (controller == nil))
        return NO;
    
    UIImagePickerController *mediaUI = [[UIImagePickerController alloc] init];
    mediaUI.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
    // Displays saved pictures and movies, if both are available, from the
    // Camera Roll album.
    mediaUI.mediaTypes =
    [UIImagePickerController availableMediaTypesForSourceType:
     UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    
    // Hides the controls for moving & scaling pictures, or for
    // trimming movies. To instead show the controls, use YES.
    mediaUI.allowsEditing = YES;
    
    mediaUI.delegate = delegate;
    
    [controller presentModalViewController: mediaUI animated: YES];
    return YES;
}

- (void) imagePickerController: (UIImagePickerController *) picker
 didFinishPickingMediaWithInfo: (NSDictionary *) info {
    
    [self dismissViewControllerAnimated:YES completion:^{
        [self displayPickedMedia:info];
    }];
}

- (void) displayPickedMedia:(NSDictionary *)info{
    self.image = nil;
    if([info[UIImagePickerControllerMediaType]isEqualToString:(NSString *) kUTTypeImage]){
        UIImage *pickedImage = info[UIImagePickerControllerEditedImage];
        //WHAT IS THIS?  I DUUNO
        if(!pickedImage){
            pickedImage = info[UIImagePickerControllerOriginalImage];
        }
        if(pickedImage) {
            //TODO: remove hardcode, hooks for Retina
            //http://developer.apple.com/library/ios/#documentation/AVFoundation/Reference/AVFoundation_Functions/Reference/reference.html
            self.image = [self resizeImage:pickedImage scaledToSize:CGSizeMake(225, 225)];
            NSLog(@"%f %f", pickedImage.size.height, pickedImage.size.width);
            [self arrangeView];
        }
    }
}
@end