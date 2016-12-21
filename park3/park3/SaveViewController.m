//
//  SaveViewController.m
//  park2
//
//  Created by SWUComputer on 2016. 12. 20..
//  Copyright © 2016년 SWUComputer. All rights reserved.
//

#import "SaveViewController.h"
#import <CoreData/CoreData.h>


@interface SaveViewController ()

@end

@implementation SaveViewController
@synthesize img;
@synthesize textPName, textTitle, textContent,imageView;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (![UIImagePickerController
          isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertController *alert= [UIAlertController alertControllerWithTitle:@"Error!"
                                                                      message:@"Device has no camera"
                                                               preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok=
        [UIAlertAction
         actionWithTitle:@"OK" style:UIAlertActionStyleDefault
         handler:^(UIAlertAction *action){
             [alert dismissViewControllerAnimated:YES completion:nil];
         }];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (IBAction)savePressed:(UIBarButtonItem *)sender {
    NSManagedObjectContext *context =nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    
    //diary record 생성
    NSManagedObject *newDiary = [NSEntityDescription insertNewObjectForEntityForName:@"Diary"
                                                              inManagedObjectContext:context];

    
    UIImage *image=self.imageView.image;
    //NSString *imageRoute;
    NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
    
    
    [newDiary setValue:textTitle.text forKey:@"title"];
    [newDiary setValue:textPName.text forKey:@"park_name"];
    [newDiary setValue:textContent.text forKey:@"content"];
    [newDiary setValue:[NSDate date] forKey:@"date"];
    [newDiary setValue:imageData forKey:@"imageData"];
    
    NSError *error=nil;
    
    if(![context save:&error]){
        NSLog(@"Save Failed! %@ %@",error,[error localizedDescription]);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)takeButton:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init]; picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:picker animated:YES completion:NULL];
}

- (IBAction)selectButton:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init]; picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:NULL];
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    //UIImage *chosenImage = [info objectForKey:UIImagePickerControllerEditedImage];
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

@end
