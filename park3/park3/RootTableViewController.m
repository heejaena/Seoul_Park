//
//  RootTableViewController.m
//  park2
//
//  Created by SWUComputer on 2016. 12. 20..
//  Copyright © 2016년 SWUComputer. All rights reserved.
//

#import "RootTableViewController.h"
#import "DetailViewController.h"
#import <CoreData/CoreData.h>

@interface RootTableViewController ()

@end

@implementation RootTableViewController
@synthesize diarys;

//managed object context를 조회하거나 나중에 자료를 저장하기 위한 다양한 용도에 쓰임
-(NSManagedObjectContext *)managedObjectContext{
    NSManagedObjectContext *context=nil;
    id delegate=[[UIApplication sharedApplication]delegate];
    if([delegate performSelector:@selector(managedObjectContext)]){
        context=[delegate managedObjectContext];
    }
    return context;
}

//view가 보여줄떄 자룔르 db에서 가져오도록 한다
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    //persistent data store
    NSManagedObjectContext *moc =[self managedObjectContext];
    NSFetchRequest *fetchRequest=[[NSFetchRequest alloc]initWithEntityName:@"Diary"];
    
    //edit the sort key as appropriate
    NSSortDescriptor *sortDescriptor=[[NSSortDescriptor alloc]initWithKey:@"title" ascending:YES];
    NSArray *sortDescriptors=@[sortDescriptor];
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    diarys=[[moc executeFetchRequest:fetchRequest error:nil]mutableCopy];
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return diarys.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Diary Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    //테이블 화면에 나올 내용
    NSManagedObject *diary=[diarys objectAtIndex:indexPath.row];
    [cell.textLabel setText:[NSString stringWithFormat:@"%@ - %@",[diary valueForKey:@"title"],[diary valueForKey:@"park_name"]]];
    
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy.MM.dd"];
    
    [cell.detailTextLabel setText:[formatter stringFromDate:[diary valueForKey:@"date"]]];
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        NSManagedObjectContext *context=[self managedObjectContext];
        [context deleteObject:[diarys objectAtIndex:indexPath.row]];
        
        NSError *error=nil;
        
        if(![context save:&error]){
            NSLog(@"Save Failed! %@ %@",error,[error localizedDescription]);
        }
        //remove diary from table view
        [diarys removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"toDetail"]){
        
        NSIndexPath *indexPath=[self.tableView indexPathForSelectedRow];
        NSManagedObject *selectedDiary=[diarys objectAtIndex:indexPath.row];
        
        DetailViewController *dVC=[segue destinationViewController];
        
        dVC.detailDiary=selectedDiary;
        NSString *pTitle=[selectedDiary valueForKey:@"title"];
        NSString *pName=[selectedDiary valueForKey:@"park_name"];
        dVC.title=[NSString stringWithFormat:@"%@ - %@",pTitle,pName];
        
    }
}

@end
