//
//  DisplayViewController.m
//  StoryPictureViewer
//
//  Created by Admin on 11/1/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "DisplayViewController.h"

@interface DisplayViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *currentImage;

@end

@implementation DisplayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = self.currentPhoto.name;
    
    NSString *imageName = [self.currentPhoto filename];
    UIImage *image = [UIImage imageNamed:imageName];
    [self.currentImage setImage:image];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    InfoViewController *ivc = [segue destinationViewController];
    
    // Pass the selected object to the new view controller.
    [ivc setCurrentPhoto:self.currentPhoto];
}

@end
