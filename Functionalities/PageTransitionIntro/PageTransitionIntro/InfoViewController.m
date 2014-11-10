//
//  InfoViewController.m
//  PageTransitionIntro
//
//  Created by Admin on 11/1/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// ON BACK BUTTON ANOUNCE GOING BACK TO DELEGATE
- (IBAction)goBack:(id)sender {
    [self.delegate infoViewControllerDidFinish:self];
}


@end
