//
//  ViewController.h
//  CustomTableViewWithBackOption
//
//  Created by Admin on 11/3/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Thing.h"

@interface ViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *innerTableView;

@end

