//
//  LocationGetterViewController.h
//  GetUserLocation
//
//  Created by Admin on 11/7/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationGetterViewController : UIViewController <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;

@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;

@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

@property (strong, nonatomic)CLLocation *currentLocation;

- (IBAction)getCurrentLocation:(id)sender;

@end
