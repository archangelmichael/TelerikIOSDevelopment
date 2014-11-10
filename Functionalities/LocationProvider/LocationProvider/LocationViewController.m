//
//  LocationViewController.m
//  LocationProvider
//
//  Created by Admin on 11/7/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "LocationViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "MapViewController.h"

@interface LocationViewController ()

@end

@implementation LocationViewController {
    CLLocationManager *locationManager;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.progressBar stopAnimating];
    locationManager = [[CLLocationManager alloc] init];
    geocoder = [[CLGeocoder alloc] init];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)goToThisView:(UIStoryboardSegue *) segue{
    //id source = [segue sourceViewController];
    //id destination = [segue destinationViewController];
    [[[UIAlertView alloc] initWithTitle:@"You are back" message:@"Welcome" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
}


- (IBAction)getCurrentLocation:(id)sender {
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    locationManager.distanceFilter = kCLLocationAccuracyHundredMeters;
    locationManager.delegate = self;
    [locationManager requestAlwaysAuthorization];
    [locationManager startUpdatingLocation];
    [self.progressBar startAnimating];
    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    [self.progressBar stopAnimating];
    self.currentLocation = [locations lastObject];
    
    if (self.currentLocation != nil) {
        self.longitudeOutput.text = [NSString stringWithFormat:@"%.8f", self.currentLocation.coordinate.longitude];
        self.latitudeOutput.text = [NSString stringWithFormat:@"%.8f", self.currentLocation.coordinate.latitude];
    }
    
    [locationManager stopUpdatingLocation];
    
    [geocoder reverseGeocodeLocation:self.currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
        if (error == nil && [placemarks count] > 0) {
            placemark = [placemarks lastObject];
            self.locationOutput.text = [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@",
                                        placemark.subThoroughfare == nil ? placemark.subThoroughfare : @"",
                                        placemark.thoroughfare,
                                        placemark.postalCode == nil ? placemark.postalCode : @"",
                                        placemark.locality,
                                        placemark.administrativeArea,
                                        placemark.country];
        } else {
            NSLog(@"%@", error.debugDescription);
        }
    }];
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    [self.progressBar stopAnimating];
    [[[UIAlertView alloc] initWithTitle:@"Location error" message:@"Cannot detect your location! Check you connectivity and permissions" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show ];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    if ([[segue identifier] isEqualToString:@"showMapSegue"]) {
        MapViewController *mvc = [segue destinationViewController];
        CLLocation *currentLocation = [[CLLocation alloc] initWithLatitude:self.currentLocation.coordinate.latitude longitude:self.currentLocation.coordinate.longitude];
        mvc.currentLocation = currentLocation;
    }
    // Pass the selected object to the new view controller.
}


@end
