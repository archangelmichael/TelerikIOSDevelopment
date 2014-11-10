//
//  ViewController.m
//  StoryTransfer
//
//  Created by Admin on 10/28/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "ViewController.h"
#import "Scene2ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    NSString *toScene2Indentifier = @"toScene2";
    if ([segue.identifier isEqualToString:toScene2Indentifier]) {
        
        NSDateFormatter *DateFormatter=[[NSDateFormatter alloc] init];
        [DateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
        NSString *currentDate = [DateFormatter stringFromDate:[NSDate date]];
        
        Scene2ViewController *toVC = segue.destinationViewController;
        toVC.date.text = currentDate;
    }
}
 */


@end
