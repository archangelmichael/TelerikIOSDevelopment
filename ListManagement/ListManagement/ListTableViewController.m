//
//  ListTableViewController.m
//  ListManagement
//
//  Created by Admin on 11/2/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "ListTableViewController.h"

@interface ListTableViewController ()

@end

@implementation ListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"All Lists";
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    [self getData];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return [self.data getListsCount];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    List *currentList = [self.data getListByIndex:indexPath.row];
    cell.textLabel.text = currentList.listTitle;
    cell.detailTextLabel.text = currentList.listCategory;
    
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
        [self.data removeListByIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } /* else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   */
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"showListNotesSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NotesTableViewController *ntvc = [segue destinationViewController];
        List *selectedList = [self.data getListByIndex:indexPath.row];
        ntvc.currentList = selectedList;
    }
}

-(void)getData{
    self.data = [[ListData alloc] init];
    
    List *list = [[List alloc] initWithTitle:@"iOS" withCategory:@"Homework"];
    Note *note = [[Note alloc] initWithTitle:@"Custom Views" withDescription:@"Watch custom views lecture."];
    [list addNote:note];
    note = [[Note alloc] initWithTitle:@"Delegates" withDescription:@"Watch delegates lecture."];
    [list addNote:note];
    [self.data addList:list];
    
    list = [[List alloc] initWithTitle:@"MVC" withCategory:@"Homework"];
    note = [[Note alloc] initWithTitle:@"Angular" withDescription:@"Watch all angular lectures."];
    [list addNote:note];
    [self.data addList:list];
}

@end
