//
//  ListTableViewController.h
//  ListManagement
//
//  Created by Admin on 11/2/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"
#import "List.h"
#import "ListData.h"
#import "NotesTableViewController.h"

@interface ListTableViewController : UITableViewController

@property (strong, nonatomic) ListData *data;

@end
