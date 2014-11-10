//
//  InfoViewController.h
//  PageTransitionIntro
//
//  Created by Admin on 11/1/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class InfoViewController;

@protocol InfoViewControllerDelegate
-(void) infoViewControllerDidFinish:(InfoViewController *)controller;
@end



@interface InfoViewController : UIViewController

@property (weak, nonatomic) id <InfoViewControllerDelegate> delegate;
- (IBAction)goBack:(id)sender;
@end

