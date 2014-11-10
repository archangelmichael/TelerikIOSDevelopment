//
//  PasswordsTableViewController.m
//  PasswordsTable
//
//  Created by Admin on 11/1/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "PasswordsTableViewController.h"

@interface PasswordsTableViewController () {
    NSMutableArray *passwords;
}

@end

@implementation PasswordsTableViewController
- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

// INSERT RANDOM PASSWORD
- (IBAction)addRandomPassword:(id)sender {
    if (!passwords) {
        passwords = [[NSMutableArray alloc] init];
    }
    
    NSString *randomAccountName = [self randomStringWithLength:7];
    NSString *randomPasswordCode = [self randomStringWithLength:12];
    NSString *randomCypher = [self randomStringWithLength:6];
    Password *randomPassword = [Password passwordWithPassword:randomPasswordCode withAccountName:randomAccountName withEncryptionCode:randomCypher];
    [passwords insertObject:randomPassword atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


// GENERATE RANDOM NSSTRING
NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
-(NSString *) randomStringWithLength: (int) len {
    
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    
    for (int i=0; i<len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform([letters length])]];
    }
    
    return randomString;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSArray *arrOfPasswords = @[
                                      [Password passwordWithPassword:@"MY SECRET PASSWORD" withAccountName:@"KALIN" withEncryptionCode:@"WORD"],
                                      [Password passwordWithPassword:@"TOP SECRET" withAccountName:@"MARIN" withEncryptionCode:@"TRY HARDER"],
                                      [Password passwordWithPassword:@"MOST WANTED CODE" withAccountName:@"MIGLENA" withEncryptionCode:@"CHEATER"],
                                      [Password passwordWithPassword:@"I AM IN LOVE" withAccountName:@"ANTONI" withEncryptionCode:@"RARELY"],
                                      [Password passwordWithPassword:@"MY HARD PASSWORD" withAccountName:@"VASIL" withEncryptionCode:@"VASIL"],
                                      [Password passwordWithPassword:@"MY PASSWORD" withAccountName:@"KONSTANTIN" withEncryptionCode:@"MY CYPHER"],
                                      [Password passwordWithPassword:@"FAVOURITE BIRD" withAccountName:@"ILARION" withEncryptionCode:@"EAGLE"],
                                      [Password passwordWithPassword:@"HIS SECRET PASS" withAccountName:@"KIRIL" withEncryptionCode:@"MATCHPASS"]];
    passwords = [[NSMutableArray alloc] initWithArray:arrOfPasswords];
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
    return passwords.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    long row = indexPath.row;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"passwordCell" forIndexPath:indexPath];
    
    Password * current = passwords[row];
    cell.textLabel.text = [[NSString alloc] initWithFormat:@"User: %@", current.accountName];
    cell.detailTextLabel.text =  [[NSString alloc] initWithFormat:@"Encrypted pass: %@",  current.encryptedPassword];
    
    // Configure the cell...
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
    DetailsViewController *dvc = [segue destinationViewController];
    
    // Pass the selected object to the new view controller.
    // Pass the selected object to the new view controller.
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    long row = [path row];
    Password *currentPass = passwords[row];
    [dvc setCurrentPassword:currentPass];
}

@end
