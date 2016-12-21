//
//  DetailViewController.h
//  park2
//
//  Created by SWUComputer on 2016. 12. 20..
//  Copyright © 2016년 SWUComputer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *textTitle;
@property (strong, nonatomic) IBOutlet UITextField *textPName;
@property (strong, nonatomic) IBOutlet UITextField *saveDate;
@property (strong, nonatomic) IBOutlet UITextView *textContent;

@property (strong, nonatomic) IBOutlet UIImageView *imagee;


@property (strong, nonatomic) NSManagedObject *detailDiary;

@end
