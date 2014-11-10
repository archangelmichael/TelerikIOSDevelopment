//
//  ViewController.m
//  CustomViews
//
//  Created by Admin on 11/4/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "ViewController.h"
#import "CustomViewManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // LOAD CUSTOM VIEW WITHOUT CUSTOM UIVIEW CLASS
    /*
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"CustomView" owner:self options:nil];
    UIView *createdView = (UIView *)[nibs objectAtIndex:0];
    [self.view addSubview:createdView];
    */
    
    // LOAD CUSTOM VIEW WITH CUSTOM UIVIEW
    CustomViewManager *customView = [[[NSBundle mainBundle] loadNibNamed:@"CustomView" owner:self options:nil]objectAtIndex:0];
    [self.view addSubview:customView];
    // ATTACH EVENT TO BUTTON FROM CUSTOM VIEW
    [customView.button addTarget:self action:@selector(showWarning) forControlEvents:UIControlEventTouchUpInside];
    
    // CREATE CUSTOM BUTTON
    CGRect createdRectengle = CGRectMake(20, 20, 20, 20);
    UIButton *buttonWithRect = [[UIButton alloc]initWithFrame:createdRectengle];
    
    // CREATE AND SET CUSTOM BUTTON
    UIButton *createdButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    createdButton.frame = CGRectMake(50, 50, 200, 100);
    createdButton.backgroundColor = [UIColor redColor];
    [createdButton setTitle:@"Created Button" forState:UIControlStateNormal];
    [createdButton setTitle:@"Clicked Button" forState:UIControlStateHighlighted];
    createdButton.titleLabel.font = [UIFont boldSystemFontOfSize:28.0f];
    createdButton.titleLabel.textColor = [UIColor greenColor];
    
    [self.view addSubview:createdButton];
}

-(void) showWarning {
    [[[UIAlertView alloc] initWithTitle:@"Be Careful!" message:@"cant touch this" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
