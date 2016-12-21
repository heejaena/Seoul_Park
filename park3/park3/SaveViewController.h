//
//  SaveViewController.h
//  park2
//
//  Created by SWUComputer on 2016. 12. 20..
//  Copyright © 2016년 SWUComputer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SaveViewController : UIViewController <UITextFieldDelegate,
UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UITextField *textTitle;
@property (strong, nonatomic) IBOutlet UITextField *textPName;
@property (strong, nonatomic) IBOutlet UITextView *textContent;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic, retain) NSData *img;

- (IBAction)savePressed:(UIBarButtonItem *)sender;
-(BOOL)textFieldShouldReturn:(UITextField *)textField;

- (IBAction)takeButton:(UIButton *)sender;
- (IBAction)selectButton:(UIButton *)sender;

@end
