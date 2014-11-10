//
//  LocationViewController.h
//  LocationProvider
//
//  Created by Admin on 11/7/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationViewController : UIViewController <CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *latitudeOutput;

@property (weak, nonatomic) IBOutlet UILabel *longitudeOutput;

@property (weak, nonatomic) IBOutlet UILabel *locationOutput;

@property (strong, nonatomic)CLLocation *currentLocation;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *progressBar;

- (IBAction)getCurrentLocation:(id)sender;

@end
