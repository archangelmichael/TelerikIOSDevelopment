//
//  ViewController.m
//  RequestPerformer
//
//  Created by Admin on 11/4/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "ViewController.h"
#import "Requester.h"

@interface ViewController () 

@end

@implementation ViewController {
    Requester *requester;
}

static NSString * url = @"http://localhost:3000";
static NSString * sampleData = @" {\"name\":\"mike tyson\"}";

- (void)viewDidLoad {
    [super viewDidLoad];
    requester = [Requester requesterWithUrl:url];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)getHTTPRequest:(id)sender {
    [requester getData];
    NSArray *data = requester.responceData;
    // make something with data;
}
- (IBAction)putHTTPRequest:(id)sender {
    // GET DATA TO BE SENT
    [requester putData:sampleData];
    NSArray *data = requester.responceData;
    // make something with data;
}
- (IBAction)postHTTPRequest:(id)sender {
    // GET DATA TO BE SENT
    [requester postData:sampleData];
    NSArray *data = requester.responceData;
    // make something with data;
}
- (IBAction)deleteHTTPRequest:(id)sender {
    // GET DATA TO BE SENT
    [requester deleteData:sampleData];
    NSArray *data = requester.responceData;
    // make something with data;
}

@end
