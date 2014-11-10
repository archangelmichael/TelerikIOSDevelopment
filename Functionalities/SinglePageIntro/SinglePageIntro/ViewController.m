//
//  ViewController.m
//  SinglePageIntro
//
//  Created by Admin on 10/31/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *NewUsernameInput;
@property (weak, nonatomic) IBOutlet UILabel *NewUsernameLabel;

@end

@implementation ViewController
- (IBAction)getDate:(id)sender {
}

// SETS CHANGE LABEL ON BUTTON CLICK
- (IBAction)getSelection:(UIButton *)sender {
}
- (IBAction)getSel:(id)sender {
}
- (IBAction)getSelected:(UIButton *)sender {
}
- (IBAction)getDate:(id)sender {
}
- (IBAction)showUsername:(id)sender {
    NSString *username = self.NewUsernameInput.text;
    self.NewUsernameLabel.text = username;
    self.NewUsernameInput.text = @"";
    [self.NewUsernameInput resignFirstResponder];
}
- (IBAction)getSelection:(id)sender {
}
- (IBAction)getSelection:(id)sender {
}

// Attach text field delegate to view controller and make return button click
// make the keyboard disappear
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

// MAKES KAYBOARD DISAPPEAR IF WE TOUCH ANYWHERE ELSE ON SCREEN
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // SET ALERT MESSAGE ON VIEW LOADED
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Initial Alert" message:@"View Loaded Correctly" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
    [alert show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
