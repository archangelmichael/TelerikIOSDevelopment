//
//  ViewController.m
//  GetUserLocation
//
//  Created by Admin on 11/7/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    MKUserLocation *currentlocation;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.mapLocationView.delegate = self;
    [self.mapLocationView setShowsUserLocation:YES];
    [[[CLLocationManager alloc] init] requestWhenInUseAuthorization];
    
//    [self.mapLocationView.userLocation addObserver:self
//                                forKeyPath:@"location"
//                                   options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld)
//                                   context:NULL];
}

//- (void)observeValueForKeyPath:(NSString *)keyPath
//                      ofObject:(id)object
//                        change:(NSDictionary *)change
//                       context:(void *)context {
//    
//    if ([self.mapLocationView showsUserLocation]) {
//        CLLocationCoordinate2D mapLocation = [currentlocation coordinate];
//        MKCoordinateRegion zoomRegion = MKCoordinateRegionMakeWithDistance(mapLocation, 2500, 2500);
//        [self.mapLocationView setRegion:zoomRegion animated:YES];
//    }
//}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    CLLocationCoordinate2D mapLocation = [userLocation coordinate];
    currentlocation = userLocation;
    
    MKCoordinateRegion zoomRegion = MKCoordinateRegionMakeWithDistance(mapLocation, 2500, 2500);
    
    [self.mapLocationView setRegion:zoomRegion animated:YES];
}


-(NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}


//-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
//    return toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
