//
//  CreateNoteViewController.m
//  ListManagement
//
//  Created by Admin on 11/2/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "CreateNoteViewController.h"
#import "Note.h"
#import "NotesTableViewController.h"

@interface CreateNoteViewController ()
@property (weak, nonatomic) IBOutlet UITextField *noteTitleText;
@property (weak, nonatomic) IBOutlet UITextView *noteDescriptionText;
@property (weak, nonatomic) IBOutlet UIDatePicker *noteDatePicker;

@end

@implementation CreateNoteViewController
- (IBAction)createNewNote:(id)sender {
    NSString *title = self.noteTitleText.text;
    NSString *description = self.noteDescriptionText.text;
    NSDate *date = self.noteDatePicker.date;
    
    UIAlertView *alert;
    
    if (title == nil || title.length < 2 ) {
        alert = [[UIAlertView alloc] initWithTitle:@"Invalid Title!"
                                           message:@"Title must be at least 3 symbols."
                                          delegate:nil
                                 cancelButtonTitle:@"Ok"
                                 otherButtonTitles:nil, nil];
    }
    else if(description == nil || description.length < 2){
        alert = [[UIAlertView alloc] initWithTitle:@"Invalid Description!"
                                           message:@"Description must be at least 3 symbols."
                                          delegate:nil
                                 cancelButtonTitle:@"Ok"
                                 otherButtonTitles:nil, nil];
    }
    else{
        Note *newNote = [Note noteWithTitle:title withDescription:description withDate:date];
        NSInteger index = self.navigationController.viewControllers.count - 2;
        NotesTableViewController *parentController = [self.navigationController.viewControllers objectAtIndex:index];
        [parentController.currentList.listNotes addObject:newNote];
        
        alert = [[UIAlertView alloc] initWithTitle:@"Success!"
                                           message:@"Note created successfully."
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

@end
