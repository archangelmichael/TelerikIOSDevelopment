//
//  ViewController.m
//  EventTable
//
//  Created by Admin on 10/26/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "ViewController.h"
#import "EventManager.h"
#import "Event.h"

@interface ViewController ()

@end

@implementation ViewController
{
    EventManager *manager;
    NSMutableArray *events;
    NSArray *titles;
    NSArray *avatars;
    NSArray *dates;
    NSArray *descriptions;
    NSArray *categories;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    manager = [[EventManager alloc] init];
    events = [[NSMutableArray alloc] init];
    for (Event *event in [manager getAllEvents]) {
        NSString *eventTitle = event.title;
        [events addObject:eventTitle];
    }
    
    /* USING plist file for the data
    NSString *path = [[NSBundle mainBundle] pathForResource:@"EventsData" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    titles = [dict objectForKey:@"Title"];
    avatars = [dict objectForKey:@"Avatar"];
    dates = [dict objectForKey:@"Date"];
    descriptions = [dict objectForKey:@"Description"];
    categories = [dict objectForKey:@"Category"];
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [events count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    NSUInteger index = indexPath.row;
    cell.textLabel.text = [events objectAtIndex:index];
    
    /* USING plist file for data
    cell.textLabel.text = titles[index];
    cell.imageView.image = [UIImage imageNamed:avatars[index]];
     */
    return cell;
}
@end
