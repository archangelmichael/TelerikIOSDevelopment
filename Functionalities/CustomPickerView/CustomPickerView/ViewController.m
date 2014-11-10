//
//  ViewController.m
//  CustomPickerView
//
//  Created by Admin on 10/31/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *showSelectionLabel;
@property (weak, nonatomic) IBOutlet UILabel *showDateLabel;
@property (weak, nonatomic) IBOutlet UIDatePicker *getDatePicker;

@property NSArray * categories;

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
        case 0:
            background = [UIColor yellowColor];
            break;
        case 1:
            background = [UIColor greenColor];
            break;
        case 2:
            background = [UIColor redColor];
            break;
        default:
            background = [UIColor greenColor];
            break;
    }
    
    self.showSelectionLabel.text = self.categories[row];
    self.view.backgroundColor = background;
    
}


// GET DATE FROM DATEPICKER
- (IBAction)getDate:(UIButton *)sender {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"d MM YYYY"];
    NSDate * chosenDate = [self.getDatePicker date];
    NSString * dateAsString = [ formatter stringFromDate:chosenDate];
    self.showDateLabel.text = dateAsString;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.categories = @[ @"vehicles", @"parts", @"accessories"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
