//
//  DetailViewController.m
//  park2
//
//  Created by SWUComputer on 2016. 12. 20..
//  Copyright © 2016년 SWUComputer. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize textContent,textPName,textTitle,saveDate;
@synthesize detailDiary;
@synthesize imagee;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    if(detailDiary){
        textTitle.text=[detailDiary valueForKey:@"title"];
        textPName.text=[detailDiary valueForKey:@"park_name"];
        textContent.text=[detailDiary valueForKey:@"content"];
        UIImage *image1=[UIImage imageWithData:[detailDiary valueForKey:@"imageData"]];
        imagee.image=image1;
        
        NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"yyyy.MM.dd h:mm:ss a"];
        
        saveDate.text=[formatter stringFromDate:[detailDiary valueForKey:@"date"]];
    }

}


@end
