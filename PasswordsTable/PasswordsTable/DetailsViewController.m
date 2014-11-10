//
//  DetailsViewController.m
//  PasswordsTable
//
//  Created by Admin on 11/1/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *encryptedPassword;
@property (weak, nonatomic) IBOutlet UILabel *chyperKey;
@property (weak, nonatomic) IBOutlet UILabel *originalPassword;
@property (weak, nonatomic) IBOutlet UITextField *chyperKeyGuess;

@end

@implementation DetailsViewController

- (IBAction)getOriginalPassword:(id)sender {
    
    NSString *guess = [self.chyperKeyGuess text];
    self.chyperKeyGuess.text = @"";
    [self.chyperKeyGuess resignFirstResponder];

    NSString *result = [self.currentPassword decryptPassword:self.currentPassword.encryptedPassword withCypher:guess];
    self.originalPassword.text = result;
    
    NSString *originalKey = self.currentPassword.encryptionCode;
    UIAlertView *alert;
    if (![guess isEqualToString: originalKey]) {
         alert = [[UIAlertView alloc] initWithTitle:@"Hint" message:@"Use Sypher Key :)" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
    } else {
        alert = [[UIAlertView alloc] initWithTitle:@"Congratulations" message:[[NSString alloc] initWithFormat:@"Original Password: %@", result] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
    }
    [alert show];
}

// make keyboard disappear if we touch anything else
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    Password *pass = self.currentPassword;
    self.username.text = pass.accountName;
    self.encryptedPassword.text = pass.encryptedPassword;
    self.chyperKey.text = pass.encryptionCode;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
