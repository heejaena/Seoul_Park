//
//  ViewController.m
//  park2
//
//  Created by SWUComputer on 2016. 12. 20..
//  Copyright © 2016년 SWUComputer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImage *img=[UIImage imageNamed:@"park.png"];
    UIImage *scaleImage=[UIImage imageWithCGImage:[img CGImage]
                                            scale:(img.scale *2.0) orientation:(img.imageOrientation)];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:scaleImage];
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
