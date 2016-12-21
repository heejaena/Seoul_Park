//
//  SearchViewController.h
//  park2
//
//  Created by SWUComputer on 2016. 12. 20..
//  Copyright © 2016년 SWUComputer. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MapKit;

@interface SearchViewController : UIViewController{
    NSDictionary *receiveDic;
    IBOutlet UIScrollView *scroller;

}

@property (strong, nonatomic) NSString *la;
@property (strong, nonatomic) NSString *lo;


@property (strong, nonatomic) IBOutlet UILabel *info;
@property (strong, nonatomic) IBOutlet UILabel *address;
@property (strong, nonatomic) IBOutlet UITextView *pdetail;

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet MKMapView *map;

@property (strong, nonatomic) IBOutlet UIImageView *image1;

- (IBAction)searchPressed:(UIBarButtonItem *)sender;



@end
