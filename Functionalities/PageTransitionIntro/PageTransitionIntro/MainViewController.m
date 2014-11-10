//
//  ViewController.m
//  PageTransitionIntro
//
//  Created by Admin on 11/1/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "MainViewController.h"
#import "InfoViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// DELEGATE TO TRANSITION WHEN FINISHED
- (void) infoViewControllerDidFinish: (InfoViewController *)controller {
    [self dismissViewControllerAnimated:YES completion:nil];
}

// SEGUE TO LOAD INFO VIEW CONTROLLER
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"showInfo"] ) {
        [[segue destinationViewController] setDelegate:self];
    }
}

@end
