//
//  CreateListViewController.m
//  ListManagement
//
//  Created by Admin on 11/2/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "CreateListViewController.h"
#import "ListTableViewController.h"
#import "List.h"

@interface CreateListViewController ()

@property (weak, nonatomic) IBOutlet UITextField *listTitleText;

@property (weak, nonatomic) IBOutlet UITextField *listCategoryText;

@end

@implementation CreateListViewController

- (IBAction)createNewList:(id)sender {
    NSString *title = self.listTitleText.text;
    NSString *category = self.listCategoryText.text;
    UIAlertView *alert;
    
    if (title == nil || title.length < 2) {
        alert = [[UIAlertView alloc] initWithTitle:@"Invalid Title!"
                                           message:@"Title must be at least 3 symbols."
                                          delegate:nil
                                 cancelButtonTitle:@"Ok"
                                 otherButtonTitles:nil, nil];
    }
    else if(category == nil || category.length < 2){
        alert = [[UIAlertView alloc] initWithTitle:@"Invalid Category!"
                                           message:@"Category must be at least 3 symbols."
                                          delegate:nil
                                 cancelButtonTitle:@"Ok"
                                 otherButtonTitles:nil, nil];
    }
    else{
        List *newList = [List listWithTitle:title withCategory:category];
        ListTableViewController *parentController = [self.navigationController.viewControllers objectAtIndex:0];
        [parentController.data  addList:newList];
        
        alert = [[UIAlertView alloc] initWithTitle:@"Success!"
                                           message:@"List created successfully."
                                          delegate:nil
                                 cancelButtonTitle:@"Ok"
                                 otherButtonTitles:nil, nil];
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    [alert show];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


// TO CREATE RANDOM LIST
/*
 - (IBAction)addNewList:(id)sender {
 NSString *listTitle = [self randomStringWithLength:7];
 NSString *listCategory = [self randomStringWithLength:12];
 List *newList = [List listWithTitle:listTitle withCategory:listCategory];
 
 NSString *noteTitle = [self randomStringWithLength:6];
 NSString *noteDescription = [self randomStringWithLength:6];
 NSDate *noteDate = [[NSDate date] dateByAddingTimeInterval:172800 ];
 Note *newNote = [Note noteWithTitle:noteTitle withDescription:noteDescription withDate:noteDate];
 
 [newList addNote:newNote];
 [self.data addList:newList];
 NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
 [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
 
 }
 
 NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
 -(NSString *) randomStringWithLength: (int) len {
 
 NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
 
 for (int i=0; i<len; i++) {
 [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform([letters length])]];
 }
 
 return randomString;
 }
 */

@end
