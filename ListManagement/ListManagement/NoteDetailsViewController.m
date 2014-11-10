//
//  NoteDetailsViewController.m
//  ListManagement
//
//  Created by Admin on 11/2/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "NoteDetailsViewController.h"

@interface NoteDetailsViewController ()

@property (weak, nonatomic) IBOutlet UITextField *noteTitleText;
@property (weak, nonatomic) IBOutlet UITextView *noteDescriptionText;
@property (weak, nonatomic) IBOutlet UIDatePicker *noteDatePicker;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *changeModeButton;

@end

@implementation NoteDetailsViewController {
    BOOL isEditingMode;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    isEditingMode = NO;
    [self setFieldValues];
    [self disableEditingValues];
    isEditingMode = NO;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeEditMode:(id)sender {
    if (isEditingMode && [self saveChanges]) {
        isEditingMode = NO;
        [self.changeModeButton setTitle:@"Edit"];
        [self setFieldValues];
        [self disableEditingValues];
    }
    else{
        [self enableEditingValues];
        isEditingMode = YES;
        [self.changeModeButton setTitle: @"Save"];
    }
}

- (BOOL)saveChanges {
    NSString *newTitle = self.noteTitleText.text;
    NSString *newDescription = self.noteDescriptionText.text;
    NSDate *newDate = self.noteDatePicker.date;
    
    UIAlertView *alert;
    BOOL areNewValuesOK = NO;
    
    if (newTitle == nil || newTitle.length < 2 ) {
        alert = [[UIAlertView alloc] initWithTitle:@"Invalid Title!"
                                    message:@"Title must be at least 2 symbols."
                                   delegate:nil
                          cancelButtonTitle:@"Ok"
                                 otherButtonTitles:nil, nil];
    }
    else if (newDescription == nil || newDescription.length < 2){
        alert = [[UIAlertView alloc] initWithTitle:@"Invalid Description!"
                                    message:@"Description must be at least 2 symbols."
                                   delegate:nil
                          cancelButtonTitle:@"Ok"
                          otherButtonTitles:nil, nil];
    }
    else{
        areNewValuesOK = YES;
        self.currentNote.noteTitle = newTitle;
        self.currentNote.noteDescription = newDescription;
        self.currentNote.noteDate = newDate;
        
        alert = [[UIAlertView alloc] initWithTitle:@"Success!"
                                    message:@"Changes saved successfully."
                                   delegate:nil
                          cancelButtonTitle:@"Ok"
                                 otherButtonTitles:nil, nil];
    }
    
    [alert show];
    
    return areNewValuesOK;
}


-(void) setFieldValues {
    self.title = self.currentNote.noteTitle;
    self.noteTitleText.text = self.currentNote.noteTitle;
    self.noteDescriptionText.text = self.currentNote.noteDescription;
    if (self.currentNote.noteDate != nil) {
        self.noteDatePicker.date = self.currentNote.noteDate;
    }
}

-(void)enableEditingValues{
    self.noteTitleText.enabled = YES;
    self.noteDatePicker.enabled = YES;
    self.noteDatePicker.exclusiveTouch = YES;
    self.noteDescriptionText.editable = YES;
}

-(void)disableEditingValues{
    self.noteTitleText.enabled = NO;
    self.noteDatePicker.enabled = NO;
    self.noteDatePicker.exclusiveTouch = NO;
    self.noteDescriptionText.editable = NO;
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
