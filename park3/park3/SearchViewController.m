//
//  SearchViewController.m
//  park2
//
//  Created by SWUComputer on 2016. 12. 20..
//  Copyright © 2016년 SWUComputer. All rights reserved.
//

#import "SearchViewController.h"
#import "ParkData.h"

@interface SearchViewController ()

@end

@implementation SearchViewController
@synthesize info, address, pdetail;
@synthesize searchBar;
@synthesize map;
@synthesize la,lo;
@synthesize image1;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [scroller setScrollEnabled:YES];
    scroller.backgroundColor=[UIColor whiteColor];
    [scroller setContentSize:CGSizeMake(320, 1400)];
}

- (IBAction)searchPressed:(UIBarButtonItem *)sender {
    
    NSString *p_park=@"";
    p_park=searchBar.text;
    NSString* p_park1 = [p_park stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    NSString *url1=[NSString stringWithFormat:
                    @"http://openapi.seoul.go.kr:8088/714f484b6668656536324373514571/json/SearchInfoByParkNameService/1/5/%@/",p_park1];
    NSURL *url=[NSURL URLWithString:url1];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    //[request setHTTPBody:p_park1];
    [request setHTTPMethod:@"GET"];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *response = nil;
    
    NSData *urlData= [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    //NSString *responseString=[[NSString alloc]initWithBytes:[urlData bytes] length:[urlData length] encoding:NSUTF8StringEncoding];
    
    receiveDic = [NSJSONSerialization JSONObjectWithData:urlData
                                                 options:NSJSONReadingMutableContainers
                                                   error:nil];
    //NSLog(@"%@",receiveDic);
    NSDictionary *aa=[receiveDic objectForKey:@"SearchInfoByParkNameService"];
    NSArray *result01=aa[@"row"];
    
    for(int i=0;i<1;i++){
        
        NSDictionary *jsonElement=result01[i];
        // Create a new FavoriteData object and set its props to JsonElement properties
        
        ParkData *newData = [[ParkData alloc] init];
        newData.P_IDX = jsonElement[@"P_IDX"];
        newData.P_PARK = jsonElement[@"P_PARK"];
        newData.P_LIST_CONTENT = jsonElement[@"P_LIST_CONTENT"];
        newData.P_ADDR = jsonElement[@"P_ADDR"];
        newData.P_ZONE = jsonElement[@"P_ZONE"];
        newData.P_DIVISION = jsonElement[@"P_DIVISION"];
        newData.P_IMG = jsonElement[@"P_IMG"];
        newData.P_ADMINTEL = jsonElement[@"P_ADMINTEL"];
        newData.LONGITUDE = jsonElement[@"LONGITUDE"];
        newData.LATITUDE = jsonElement[@"LATITUDE"];
        newData.G_LATITUDE = jsonElement[@"G_LATITUDE"];
        newData.G_LONGITUDE=jsonElement[@"G_LONGITUDE"];
        
        // Add this question to the FavoriteData array
        //[tempArray addObject:newData];
        info.text=newData.P_PARK;
        address.text=newData.P_ADDR;
        pdetail.text=newData.P_LIST_CONTENT;
        la=newData.LATITUDE;
        lo=newData.LONGITUDE;

            NSURL *url=[[NSURL alloc]initWithString:newData.P_IMG];
            self.image1.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
        MKCoordinateRegion region;
        region.center.latitude=[la doubleValue];
        region.center.longitude=[lo doubleValue];
        region.span.latitudeDelta = 0.005;
        region.span.longitudeDelta = 0.005;
        [self.map setRegion:region animated:YES];
    }
    
    if(!urlData){
        NSLog(@"Error:%@",[error localizedDescription]);
    }
    
    
}
@end
