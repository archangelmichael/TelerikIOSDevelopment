//
//  PhotosTableViewController.m
//  StoryPictureViewer
//
//  Created by Admin on 11/1/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "PhotosTableViewController.h"

@interface PhotosTableViewController () {
    NSMutableArray *photos;
}

@end

@implementation PhotosTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.title = @"Categories";
    
    photos = [[NSMutableArray alloc] init];
    
    Photo *pic = [[Photo alloc]init];
    pic.name = @"Motorcycles Adds";
    pic.filename = @"motorcycle";
    pic.notes = @"catalogue to hold vehicle adds";
    [photos addObject:pic];
    
    pic = [[Photo alloc]init];
    pic.name = @"Parts Adds";
    pic.filename = @"parts";
    pic.notes = @"catalogue to hold parts adds";
    [photos addObject:pic];
    
    pic = [[Photo alloc]init];
    pic.name = @"Accessories Adds";
    pic.filename = @"accessories";
    pic.notes = @"catalogue to hold accessories adds";
    [photos addObject:pic];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return photos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    long row = [indexPath row];
    Photo *current = [photos objectAtIndex:row];
    cell.textLabel.text = [current name];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    DisplayViewController *dvc = [segue destinationViewController];
    
    // Pass the selected object to the new view controller.
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    long row = [path row];
    Photo *curr = photos[row];
    [dvc setCurrentPhoto:curr];
}


@end
