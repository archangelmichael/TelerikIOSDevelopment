//
//  ViewController.m
//  TableViewIntro
//
//  Created by Admin on 11/1/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSDictionary * loadedCourses;
    NSArray * courseNames;
    
    NSDictionary * loadedTeachers;
    NSArray * teacherNames;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @" Courses ";
    } else {
        return @" Teachers ";
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return courseNames.count;
    } else {
        return teacherNames.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    int row = indexPath.row;
    int section = indexPath.section;
    
    // EVERY TIME WE MAKE A NEW CELL
    //UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier: @"cell"];
    
    // USE ALREADY CREATED CELL
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" ];
    
    if (section == 0) {
        // SET TABLE VIEW IMAGE FROM IMAGES ASSETS
        UIImage *cellImage = [UIImage imageNamed:@"CourseImage"];
        [cell.imageView setImage:cellImage];
        cell.textLabel.text = [[NSString alloc] initWithFormat:@"%@", courseNames[row]];
        cell.detailTextLabel.text = loadedCourses[courseNames[row]];
    } else {
        // SET TABLE VIEW IMAGE FROM IMAGES ASSETS
        UIImage *cellImage = [UIImage imageNamed:@"TeacherImage"];
        [cell.imageView setImage:cellImage];
        cell.textLabel.text = [[NSString alloc] initWithFormat:@"%@", teacherNames[row]];
        cell.detailTextLabel.text = loadedTeachers[teacherNames[row]];
    }
    
    return  cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // GET STUDENTS LIST FROM FILE
    NSURL *coursesURL = [[NSBundle mainBundle] URLForResource:@"courses" withExtension:@"plist"];
    loadedCourses = [NSDictionary dictionaryWithContentsOfURL:coursesURL];
    courseNames = loadedCourses.allKeys;
    
    // GET TEACHERS LIST FROM FILE
    NSURL *teachersURL = [[NSBundle mainBundle] URLForResource:@"teachers" withExtension:@"plist"];
    loadedTeachers = [NSDictionary dictionaryWithContentsOfURL:teachersURL];
    teacherNames = loadedTeachers.allKeys;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
