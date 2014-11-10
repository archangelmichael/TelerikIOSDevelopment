//
//  ViewController.m
//  CustomTableViewWithBackOption
//
//  Created by Admin on 11/3/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property NSArray * categories;
@property NSArray * things;
@property NSArray * data;
@end

@implementation ViewController

// SET NUMBER OF COMPONENTS IN PICKER
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// SET NUMBER OF ROWS IN COMPONENT
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.categories count];
}

// SET ITEM FOR EACH ROW
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.categories[row];
}

// SET ACTION ON COMPONENT SELECTED
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    UIColor * background;
    switch (row) {
        case 0: {
            background = [UIColor yellowColor];
            self.data = [self getThingsFrom:self.things withCategory:vehicles];
            [self.innerTableView reloadData];
            break;
        }
        case 1:
            background = [UIColor greenColor];
            self.data = [self getThingsFrom:self.things withCategory:parts];
            [self.innerTableView reloadData];
            break;
        case 2:
            background = [UIColor redColor];
            self.data = [self getThingsFrom:self.things withCategory:accessories];
            [self.innerTableView reloadData];
            break;
        default:
            background = [UIColor greenColor];
            self.data = [self.things copy];
            [self.innerTableView reloadData];
            break;
    }
    
    //self.showSelectionLabel.text = self.categories[row];
    self.view.backgroundColor = background;
    
}

-(NSArray *) getThingsFrom: (NSArray *) arr
              withCategory: (enum category) category {
    NSMutableArray *newArray = [[NSMutableArray alloc] init];
    
    for (Thing* member  in arr) {
        if (member.category == category) {
            [newArray addObject:member ];
        }
    }
    
    return newArray;
}

// SET CUSTOM TABLE VIEW
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    long row = indexPath.row;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CustomCell"];
    }
    Thing *currentThing = self.data[row];
    
    cell.textLabel.text = currentThing.title;
    cell.detailTextLabel.text = currentThing.info;
    return  cell;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.data count];
}

// SET BACK BUTTON DESTINATION
-(IBAction)goToThisView:(UIStoryboardSegue *) segue{
    id source = [segue sourceViewController];
    id destination = [segue destinationViewController];
    [[[UIAlertView alloc] initWithTitle:@"You are back" message:@"Welcome" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.innerTableView setDataSource:self];
    // Do any additional setup after loading the view, typically from a nib.
    self.categories = @[ @"vehicles", @"parts", @"accessories", @"none"];
    self.things = @[ [Thing thing],
                     [Thing thing],
                     [Thing thingWithTitle:@"Some part" withDescription:@"damaged" withCategory:parts],
                     
                     [Thing thingWithTitle:@"Some tyre" withDescription:@"worn" withCategory:parts],
                     [Thing thingWithTitle:@"Jacket" withDescription:@"brand new" withCategory:accessories]];
    self.data = [NSArray arrayWithArray:self.things];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
